/*
 *  FILE: rmaxent.cpp
 *  AUTHOR: Timothy Jurka
 *  DATE: July 2011
 *  DESCRIPTION: C++ to R interface for the Maximum Entropy library written by Yoshimasa Tsuruoka.
 */

#include <string>
#include <sstream>
#include <iomanip>
#include <list>
#include <cmath>
#include <cstdio>
#include "maxent.h"

using namespace std;
using namespace Rcpp;

// Global variable, model
ME_Model model;

// New model
void new_model() {
    model.clear();
	model = *(new ME_Model());
}

void add_samples(int nrows, int ncols, vector<string> samples, vector<double> ia, vector<string> ja, vector<double> ra) {
	new_model();
	for (int i=0; i < nrows; i++) { // for each document
		//Rprintf("Document %d\n",i); // debug output
		ME_Sample newSample(samples[i]); // create new sample for code
		for (int j=ia[i]-1; j < ia[i+1]-1; j++) { // for each feature
			//Rprintf("Feature %s\n",features[j].c_str());
			newSample.add_feature(ja[j],ra[j]);
		}
		model.add_training_sample(newSample);
	}
}

RcppExport SEXP classify_samples(int nrows, int ncols, vector<double> ia, vector<string> ja, vector<double> ra, string model_data) {
	new_model();
	model.load_from_string(model_data);
	vector<string> results;
	vector<string> probability_names;
	
	NumericMatrix probability_matrix(nrows,model.num_classes());
	
	for (int i=0; i < nrows; i++) { // for each document
		//Rprintf("Document %d\n",i); // debug output
		ME_Sample newSample; // create new sample for code
		for (int j=ia[i]-1; j < ia[i+1]-1; j++) { // for each feature
			newSample.add_feature(ja[j],ra[j]);
		}
		
		vector<double> prob = model.classify(newSample);
		for (int k=0; k < model.num_classes(); k++) {
			probability_matrix(i,k) = prob[k];
		}
		
		results.push_back(newSample.label);
	}
	
	for (int k=0; k < model.num_classes(); k++) {
		probability_names.push_back(model.get_class_label(k));
	}
	
	List rs = List::create(results,probability_matrix,probability_names);
	
	return rs;
}

// Export weights
vector< vector<string> > export_weights() {
	list< pair< pair<string, string>, double > > fl;
	model.get_features(fl);
	
	vector<string> value1;
	vector<string> value2;
	vector<string> value3;
	for (list< pair< pair<string, string>, double> >::const_iterator i = fl.begin(); i != fl.end(); i++) {
		stringstream write_weights1;
		write_weights1 << setprecision(3) << setw(10) << i->second;
		string weights1 = write_weights1.str();
		value1.push_back(weights1);
		
		stringstream write_weights2;
		write_weights2 << left << setw(10) << i->first.first.c_str();
		string weights2 = write_weights2.str();
		value2.push_back(weights2);
		
		stringstream write_weights3;
		write_weights3 << i->first.second.c_str();
		string weights3 = write_weights3.str();
		value3.push_back(weights3);
	}
	
	vector< vector<string> > results;
	results.push_back(value1);
	results.push_back(value2);
	results.push_back(value3);
	
	return results;
}

// Print weights
void print_weights() {
	list< pair< pair<string, string>, double > > fl;
	model.get_features(fl);
	for (list< pair< pair<string, string>, double> >::const_iterator i = fl.begin(); i != fl.end(); i++) {
		Rprintf("%10.3f  %-10s %s\n", i->second, i->first.first.c_str(), i->first.second.c_str());
	}
}

// Train model
RcppExport SEXP train_model(double l1=0, double l2=0, bool sgd=FALSE, int sgd_iter=30, double sgd_eta0=1, double sgd_alpha=0.85, int heldout=0) {
	Rprintf("Training the new model...\n");
	if (heldout > 0) model.set_heldout(heldout);
    if (l1 > 0) model.use_l1_regularizer(l1);
    else if (l2 > 0) model.use_l2_regularizer(l2);
    else if (sgd) model.use_SGD();
	
    model.train();
	
	string model_data = model.save_to_string();
	vector< vector<string> > weights = export_weights();
	List rs = List::create(model_data,weights[0],weights[1],weights[2]);
	
	return rs;
}

RCPP_MODULE(maximumentropy) {
	using namespace Rcpp;
	function("add_samples", &add_samples);
	function("classify_samples", &classify_samples);
	function("new_model", &new_model);
	function("train_model", &train_model);
	function("export_weights", &export_weights);
}
