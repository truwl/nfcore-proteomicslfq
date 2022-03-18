version 1.0

workflow proteomicslfq {
	input{
		File samplesheet
		String outdir = ".&#x2F;results"
		String? email
		Boolean? help
		String publish_dir_mode = "copy"
		String? name
		String? email_on_fail
		Boolean? plaintext_email
		String max_multiqc_email_size = "25 MB"
		Boolean? monochrome_logs
		String tracedir = "./results&#x2F;pipeline_info"
		Int max_cpus = 16
		String max_memory = "128.GB"
		String max_time = "240.h"
		String custom_config_version = "master"
		String custom_config_base = "https:&#x2F;&#x2F;raw.githubusercontent.com&#x2F;nf-core&#x2F;configs&#x2F;master"
		String? hostnames
		String? config_profile_description
		String? config_profile_contact
		String? config_profile_url
		String? root_folder
		String? local_input_type
		String? expdesign
		String database
		Boolean? add_decoys
		String decoy_affix = "DECOY_"
		String affix_type = "prefix"
		Boolean? openms_peakpicking
		Boolean? peakpicking_inmemory
		String? peakpicking_ms_levels
		String search_engines = "comet"
		String enzyme = "Trypsin"
		String num_enzyme_termini = "fully"
		Int allowed_missed_cleavages = 2
		Int precursor_mass_tolerance = 5
		String precursor_mass_tolerance_unit = "ppm"
		Float fragment_mass_tolerance = 0.03
		String fragment_mass_tolerance_unit = "Da"
		String fixed_mods = "Carbamidomethyl (C)"
		String variable_mods = "Oxidation (M)"
		String fragment_method = "HCD"
		String isotope_error_range = "0,1"
		String instrument = "high_res"
		String protocol = "automatic"
		Int min_precursor_charge = 2
		Int max_precursor_charge = 4
		Int min_peptide_length = 6
		Int max_peptide_length = 40
		Int num_hits = 1
		Int max_mods = 3
		Int? db_debug
		Boolean? enable_mod_localization
		String mod_localization = "Phospho (S),Phospho (T),Phospho (Y)"
		String? luciphor_neutral_losses
		Float? luciphor_decoy_mass
		String? luciphor_decoy_neutral_losses
		Int? luciphor_debug
		String allow_unmatched = "false"
		String IL_equivalent = "true"
		String posterior_probabilities = "percolator"
		Float psm_pep_fdr_cutoff = 0.1
		Int? pp_debug
		String FDR_level = "peptide-level-fdrs"
		Float train_FDR = 0.05
		Float test_FDR = 0.05
		Int subset_max_train = 300000
		Boolean? klammer
		Int? description_correct_features
		String outlier_handling = "none"
		String consensusid_algorithm = "best"
		Int? consensusid_considered_top_hits
		Int? min_consensus_support
		String protein_inference = "aggregation"
		Float protein_level_fdr_cutoff = 0.05
		String protein_quant = "unique_peptides"
		String quantification_method = "feature_intensity"
		Boolean? mass_recalibration
		String transfer_ids = "false"
		Boolean targeted_only = true
		Int? inf_quant_debug
		Boolean? skip_post_msstats
		String? ref_condition
		String? contrasts
		Boolean? enable_qc
		String? ptxqc_report_layout

	}

	call make_uuid as mkuuid {}
	call touch_uuid as thuuid {
		input:
			outputbucket = mkuuid.uuid
	}
	call run_nfcoretask as nfcoretask {
		input:
			samplesheet = samplesheet,
			outdir = outdir,
			email = email,
			help = help,
			publish_dir_mode = publish_dir_mode,
			name = name,
			email_on_fail = email_on_fail,
			plaintext_email = plaintext_email,
			max_multiqc_email_size = max_multiqc_email_size,
			monochrome_logs = monochrome_logs,
			tracedir = tracedir,
			max_cpus = max_cpus,
			max_memory = max_memory,
			max_time = max_time,
			custom_config_version = custom_config_version,
			custom_config_base = custom_config_base,
			hostnames = hostnames,
			config_profile_description = config_profile_description,
			config_profile_contact = config_profile_contact,
			config_profile_url = config_profile_url,
			root_folder = root_folder,
			local_input_type = local_input_type,
			expdesign = expdesign,
			database = database,
			add_decoys = add_decoys,
			decoy_affix = decoy_affix,
			affix_type = affix_type,
			openms_peakpicking = openms_peakpicking,
			peakpicking_inmemory = peakpicking_inmemory,
			peakpicking_ms_levels = peakpicking_ms_levels,
			search_engines = search_engines,
			enzyme = enzyme,
			num_enzyme_termini = num_enzyme_termini,
			allowed_missed_cleavages = allowed_missed_cleavages,
			precursor_mass_tolerance = precursor_mass_tolerance,
			precursor_mass_tolerance_unit = precursor_mass_tolerance_unit,
			fragment_mass_tolerance = fragment_mass_tolerance,
			fragment_mass_tolerance_unit = fragment_mass_tolerance_unit,
			fixed_mods = fixed_mods,
			variable_mods = variable_mods,
			fragment_method = fragment_method,
			isotope_error_range = isotope_error_range,
			instrument = instrument,
			protocol = protocol,
			min_precursor_charge = min_precursor_charge,
			max_precursor_charge = max_precursor_charge,
			min_peptide_length = min_peptide_length,
			max_peptide_length = max_peptide_length,
			num_hits = num_hits,
			max_mods = max_mods,
			db_debug = db_debug,
			enable_mod_localization = enable_mod_localization,
			mod_localization = mod_localization,
			luciphor_neutral_losses = luciphor_neutral_losses,
			luciphor_decoy_mass = luciphor_decoy_mass,
			luciphor_decoy_neutral_losses = luciphor_decoy_neutral_losses,
			luciphor_debug = luciphor_debug,
			allow_unmatched = allow_unmatched,
			IL_equivalent = IL_equivalent,
			posterior_probabilities = posterior_probabilities,
			psm_pep_fdr_cutoff = psm_pep_fdr_cutoff,
			pp_debug = pp_debug,
			FDR_level = FDR_level,
			train_FDR = train_FDR,
			test_FDR = test_FDR,
			subset_max_train = subset_max_train,
			klammer = klammer,
			description_correct_features = description_correct_features,
			outlier_handling = outlier_handling,
			consensusid_algorithm = consensusid_algorithm,
			consensusid_considered_top_hits = consensusid_considered_top_hits,
			min_consensus_support = min_consensus_support,
			protein_inference = protein_inference,
			protein_level_fdr_cutoff = protein_level_fdr_cutoff,
			protein_quant = protein_quant,
			quantification_method = quantification_method,
			mass_recalibration = mass_recalibration,
			transfer_ids = transfer_ids,
			targeted_only = targeted_only,
			inf_quant_debug = inf_quant_debug,
			skip_post_msstats = skip_post_msstats,
			ref_condition = ref_condition,
			contrasts = contrasts,
			enable_qc = enable_qc,
			ptxqc_report_layout = ptxqc_report_layout,
			outputbucket = thuuid.touchedbucket
            }
		output {
			Array[File] results = nfcoretask.results
		}
	}
task make_uuid {
	meta {
		volatile: true
}

command <<<
        python <<CODE
        import uuid
        print("gs://truwl-internal-inputs/nf-proteomicslfq/{}".format(str(uuid.uuid4())))
        CODE
>>>

  output {
    String uuid = read_string(stdout())
  }
  
  runtime {
    docker: "python:3.8.12-buster"
  }
}

task touch_uuid {
    input {
        String outputbucket
    }

    command <<<
        echo "sentinel" > sentinelfile
        gsutil cp sentinelfile ~{outputbucket}/sentinelfile
    >>>

    output {
        String touchedbucket = outputbucket
    }

    runtime {
        docker: "google/cloud-sdk:latest"
    }
}

task fetch_results {
    input {
        String outputbucket
        File execution_trace
    }
    command <<<
        cat ~{execution_trace}
        echo ~{outputbucket}
        mkdir -p ./resultsdir
        gsutil cp -R ~{outputbucket} ./resultsdir
    >>>
    output {
        Array[File] results = glob("resultsdir/*")
    }
    runtime {
        docker: "google/cloud-sdk:latest"
    }
}

task run_nfcoretask {
    input {
        String outputbucket
		File samplesheet
		String outdir = ".&#x2F;results"
		String? email
		Boolean? help
		String publish_dir_mode = "copy"
		String? name
		String? email_on_fail
		Boolean? plaintext_email
		String max_multiqc_email_size = "25 MB"
		Boolean? monochrome_logs
		String tracedir = "./results&#x2F;pipeline_info"
		Int max_cpus = 16
		String max_memory = "128.GB"
		String max_time = "240.h"
		String custom_config_version = "master"
		String custom_config_base = "https:&#x2F;&#x2F;raw.githubusercontent.com&#x2F;nf-core&#x2F;configs&#x2F;master"
		String? hostnames
		String? config_profile_description
		String? config_profile_contact
		String? config_profile_url
		String? root_folder
		String? local_input_type
		String? expdesign
		String database
		Boolean? add_decoys
		String decoy_affix = "DECOY_"
		String affix_type = "prefix"
		Boolean? openms_peakpicking
		Boolean? peakpicking_inmemory
		String? peakpicking_ms_levels
		String search_engines = "comet"
		String enzyme = "Trypsin"
		String num_enzyme_termini = "fully"
		Int allowed_missed_cleavages = 2
		Int precursor_mass_tolerance = 5
		String precursor_mass_tolerance_unit = "ppm"
		Float fragment_mass_tolerance = 0.03
		String fragment_mass_tolerance_unit = "Da"
		String fixed_mods = "Carbamidomethyl (C)"
		String variable_mods = "Oxidation (M)"
		String fragment_method = "HCD"
		String isotope_error_range = "0,1"
		String instrument = "high_res"
		String protocol = "automatic"
		Int min_precursor_charge = 2
		Int max_precursor_charge = 4
		Int min_peptide_length = 6
		Int max_peptide_length = 40
		Int num_hits = 1
		Int max_mods = 3
		Int? db_debug
		Boolean? enable_mod_localization
		String mod_localization = "Phospho (S),Phospho (T),Phospho (Y)"
		String? luciphor_neutral_losses
		Float? luciphor_decoy_mass
		String? luciphor_decoy_neutral_losses
		Int? luciphor_debug
		String allow_unmatched = "false"
		String IL_equivalent = "true"
		String posterior_probabilities = "percolator"
		Float psm_pep_fdr_cutoff = 0.1
		Int? pp_debug
		String FDR_level = "peptide-level-fdrs"
		Float train_FDR = 0.05
		Float test_FDR = 0.05
		Int subset_max_train = 300000
		Boolean? klammer
		Int? description_correct_features
		String outlier_handling = "none"
		String consensusid_algorithm = "best"
		Int? consensusid_considered_top_hits
		Int? min_consensus_support
		String protein_inference = "aggregation"
		Float protein_level_fdr_cutoff = 0.05
		String protein_quant = "unique_peptides"
		String quantification_method = "feature_intensity"
		Boolean? mass_recalibration
		String transfer_ids = "false"
		Boolean targeted_only = true
		Int? inf_quant_debug
		Boolean? skip_post_msstats
		String? ref_condition
		String? contrasts
		Boolean? enable_qc
		String? ptxqc_report_layout

	}
	command <<<
		export NXF_VER=21.10.5
		export NXF_MODE=google
		echo ~{outputbucket}
		/nextflow -c /truwl.nf.config run /proteomicslfq-1.0.0  -profile truwl,nfcore-proteomicslfq  --input ~{samplesheet} 	~{"--samplesheet '" + samplesheet + "'"}	~{"--outdir '" + outdir + "'"}	~{"--email '" + email + "'"}	~{true="--help  " false="" help}	~{"--publish_dir_mode '" + publish_dir_mode + "'"}	~{"--name '" + name + "'"}	~{"--email_on_fail '" + email_on_fail + "'"}	~{true="--plaintext_email  " false="" plaintext_email}	~{"--max_multiqc_email_size '" + max_multiqc_email_size + "'"}	~{true="--monochrome_logs  " false="" monochrome_logs}	~{"--tracedir '" + tracedir + "'"}	~{"--max_cpus " + max_cpus}	~{"--max_memory '" + max_memory + "'"}	~{"--max_time '" + max_time + "'"}	~{"--custom_config_version '" + custom_config_version + "'"}	~{"--custom_config_base '" + custom_config_base + "'"}	~{"--hostnames '" + hostnames + "'"}	~{"--config_profile_description '" + config_profile_description + "'"}	~{"--config_profile_contact '" + config_profile_contact + "'"}	~{"--config_profile_url '" + config_profile_url + "'"}	~{"--root_folder '" + root_folder + "'"}	~{"--local_input_type '" + local_input_type + "'"}	~{"--expdesign '" + expdesign + "'"}	~{"--database '" + database + "'"}	~{true="--add_decoys  " false="" add_decoys}	~{"--decoy_affix '" + decoy_affix + "'"}	~{"--affix_type '" + affix_type + "'"}	~{true="--openms_peakpicking  " false="" openms_peakpicking}	~{true="--peakpicking_inmemory  " false="" peakpicking_inmemory}	~{"--peakpicking_ms_levels '" + peakpicking_ms_levels + "'"}	~{"--search_engines '" + search_engines + "'"}	~{"--enzyme '" + enzyme + "'"}	~{"--num_enzyme_termini '" + num_enzyme_termini + "'"}	~{"--allowed_missed_cleavages " + allowed_missed_cleavages}	~{"--precursor_mass_tolerance " + precursor_mass_tolerance}	~{"--precursor_mass_tolerance_unit '" + precursor_mass_tolerance_unit + "'"}	~{"--fragment_mass_tolerance " + fragment_mass_tolerance}	~{"--fragment_mass_tolerance_unit '" + fragment_mass_tolerance_unit + "'"}	~{"--fixed_mods '" + fixed_mods + "'"}	~{"--variable_mods '" + variable_mods + "'"}	~{"--fragment_method '" + fragment_method + "'"}	~{"--isotope_error_range '" + isotope_error_range + "'"}	~{"--instrument '" + instrument + "'"}	~{"--protocol '" + protocol + "'"}	~{"--min_precursor_charge " + min_precursor_charge}	~{"--max_precursor_charge " + max_precursor_charge}	~{"--min_peptide_length " + min_peptide_length}	~{"--max_peptide_length " + max_peptide_length}	~{"--num_hits " + num_hits}	~{"--max_mods " + max_mods}	~{"--db_debug " + db_debug}	~{true="--enable_mod_localization  " false="" enable_mod_localization}	~{"--mod_localization '" + mod_localization + "'"}	~{"--luciphor_neutral_losses '" + luciphor_neutral_losses + "'"}	~{"--luciphor_decoy_mass " + luciphor_decoy_mass}	~{"--luciphor_decoy_neutral_losses '" + luciphor_decoy_neutral_losses + "'"}	~{"--luciphor_debug " + luciphor_debug}	~{"--allow_unmatched '" + allow_unmatched + "'"}	~{"--IL_equivalent '" + IL_equivalent + "'"}	~{"--posterior_probabilities '" + posterior_probabilities + "'"}	~{"--psm_pep_fdr_cutoff " + psm_pep_fdr_cutoff}	~{"--pp_debug " + pp_debug}	~{"--FDR_level '" + FDR_level + "'"}	~{"--train_FDR " + train_FDR}	~{"--test_FDR " + test_FDR}	~{"--subset_max_train " + subset_max_train}	~{true="--klammer  " false="" klammer}	~{"--description_correct_features " + description_correct_features}	~{"--outlier_handling '" + outlier_handling + "'"}	~{"--consensusid_algorithm '" + consensusid_algorithm + "'"}	~{"--consensusid_considered_top_hits " + consensusid_considered_top_hits}	~{"--min_consensus_support " + min_consensus_support}	~{"--protein_inference '" + protein_inference + "'"}	~{"--protein_level_fdr_cutoff " + protein_level_fdr_cutoff}	~{"--protein_quant '" + protein_quant + "'"}	~{"--quantification_method '" + quantification_method + "'"}	~{true="--mass_recalibration  " false="" mass_recalibration}	~{"--transfer_ids '" + transfer_ids + "'"}	~{true="--targeted_only  " false="" targeted_only}	~{"--inf_quant_debug " + inf_quant_debug}	~{true="--skip_post_msstats  " false="" skip_post_msstats}	~{"--ref_condition '" + ref_condition + "'"}	~{"--contrasts '" + contrasts + "'"}	~{true="--enable_qc  " false="" enable_qc}	~{"--ptxqc_report_layout '" + ptxqc_report_layout + "'"}	-w ~{outputbucket}
	>>>
        
    output {
        File execution_trace = "pipeline_execution_trace.txt"
        Array[File] results = glob("results/*/*html")
    }
    runtime {
        docker: "truwl/nfcore-proteomicslfq:1.0.0_0.1.0"
        memory: "2 GB"
        cpu: 1
    }
}
    