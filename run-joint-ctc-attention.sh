# -*- coding: utf-8 -*-
# Soohwan Kim, Seyoung Bae, Cheolhwang Won.
# @ArXiv : KoSpeech: Open-Source Toolkit for End-to-End Korean Speech Recognition
# This source code is licensed under the Apache 2.0 License license found in the
# LICENSE file in the root directory of this source tree.

ARCHITECTURE='las'
DATASET='kspon'
DATASET_PATH='your_dataset_path'
TRANSCRIPTS_PATH='../data/transcripts.txt'
OUTPUT_UNIT='character'
OPTIMIZER='adam'
AUDIO_EXTENSION='pcm'
BATCH_SIZE=32
NUM_WORKERS=4
NUM_EPOCHS=20
HIDDEN_DIM=768
DROPOUT=0.3
NUM_HEADS=4
ATTN_MECHANISM='multi-head'   # multi-head, loc, additive, scaled-dot
REDUCTION='mean'
NUM_ENCODER_LAYERS=3
NUM_DECODER_LAYERS=1
RNN_TYPE='lstm'
TEACHER_FORCING_RATIO=1.0
TEACHER_FORCING_STEP=0.0
MIN_TEACHER_FORCING_RATIO=1.0
MAX_LEN=400
MAX_GRAD_NORM=200
WEIGHT_DECAY=1e-05
INIT_LR=1e-04
PEAK_LR=1e-04
FINAL_LR=1e-06
INIT_LR_SCALE=0.01
FINAL_LR_SCALE=0.05
WARMUP_STEPS=0
FRAME_LENGTH=20
FRAME_SHIFT=10
SAMPLE_RATE=16000
N_MELS=80
FEATURE_EXTRACT_BY='kaldi'        # You can set 'librosa', 'torchaudio'
TRANSFORM_METHOD='fbank'          # Support feature : spect, mel, mfcc, fbank
EXTRACTOR='vgg'                   # Support extractor : vgg, ds2 (DeepSpeech2)
ACTIVATION='hardtanh'             # Support activation : ReLU, ELU, Hardtanh, GELU, LeakyReLU
FREQ_MASK_PARA=18
TIME_MASK_NUM=4
FREQ_MASK_NUM=2
SAVE_RESULT_EVERY=1000
CHECKPOINT_EVERY=5000
PRINT_EVERY=10
CROSS_ENTROPY_WEIGHT=0.6
CTC_WEIGHT=0.4
MODE='train'

# shellcheck disable=SC2164
cd bin
echo "KoSpeech: Open-Source Toolkit for End-to-End Korean Speech Recognition =="

python ./main.py --batch_size $BATCH_SIZE --num_workers $NUM_WORKERS --num_epochs $NUM_EPOCHS --use_bidirectional \
--transcripts_path $TRANSCRIPTS_PATH --dataset $DATASET --audio_extension $AUDIO_EXTENSION --output_unit $OUTPUT_UNIT \
--optimizer $OPTIMIZER --use_cuda --hidden_dim $HIDDEN_DIM --dropout $DROPOUT --num_heads $NUM_HEADS \
--transform_method $TRANSFORM_METHOD --architecture $ARCHITECTURE \
--num_encoder_layers $NUM_ENCODER_LAYERS --num_decoder_layers $NUM_DECODER_LAYERS --rnn_type $RNN_TYPE \
--teacher_forcing_ratio $TEACHER_FORCING_RATIO \
--sample_rate $SAMPLE_RATE --frame_length $FRAME_LENGTH --frame_shift $FRAME_SHIFT --n_mels $N_MELS --normalize --del_silence \
--feature_extract_by $FEATURE_EXTRACT_BY --freq_mask_para $FREQ_MASK_PARA \
--time_mask_num $TIME_MASK_NUM --freq_mask_num $FREQ_MASK_NUM --save_result_every $SAVE_RESULT_EVERY \
--checkpoint_every $CHECKPOINT_EVERY --print_every $PRINT_EVERY \
--init_lr $INIT_LR --final_lr $FINAL_LR --peak_lr $PEAK_LR --init_lr_scale $INIT_LR_SCALE --final_lr_scale $FINAL_LR_SCALE \
--mode $MODE --dataset_path $DATASET_PATH \
--max_grad_norm $MAX_GRAD_NORM --warmup_steps $WARMUP_STEPS --max_len $MAX_LEN \
--weight_decay $WEIGHT_DECAY --reduction $REDUCTION \
--attn_mechanism $ATTN_MECHANISM --teacher_forcing_step $TEACHER_FORCING_STEP \
--min_teacher_forcing_ratio $MIN_TEACHER_FORCING_RATIO --extractor $EXTRACTOR --activation $ACTIVATION \
--cross_entropy_weight $CROSS_ENTROPY_WEIGHT --ctc_weight $CTC_WEIGHT --mask_conv --joint_ctc_attention
