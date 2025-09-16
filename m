Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DA92E36E3
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758007660; cv=none; b=s9EtEpWbrVbvr42i2hdQq5O5qDEb/jAVrjqF71U5cqQQuNGbwzTotB3lUC8HaVLDEweycukR4EUmNNslg0jbY7kHhqCTCjDXWqLXMEJ01hSxC/f+svIQC2qcCYYcBuL04zBwcDGSithUv4JOTZ+yKnYnreJpB3agJPTB4Lo0mes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758007660; c=relaxed/simple;
	bh=F9b2EyhEO6rGTgADu2vlV7ZYUMvWMAZOSNB2YByeOEQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HbMXlfDxPXuDxvnSBO85qTsoL/5sl9ez0cftfSO/NfwnQ8tmIG0K3VO8nHkmaT4yTqxwFsosi1LsrOC85k7rjpPQHRcSJXpNASjfYoW87lLvc6A3G+AkHSuubjWCeYcBfkF8cbATM7y74N8VdOpjplV3bkcXMNetAUsjcHal4gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=md3D30oF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="md3D30oF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-26763bb9a92so15000535ad.2
        for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 00:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758007658; x=1758612458; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YdzUgBNm+Fykgerb+7FYicUv4mSP6WHZUtexZFjMOI8=;
        b=md3D30oFePNRl3WGzLZ0lS4QwQvXXnlqO9QadUcV161033/uTGwc57LefbYIv3q0wF
         8QEdB74oKejzDuUKC/f0hQv9nyUJGcAtwUtuH7ta0y5s5W8bXQa9vpKxDfEaw6Rjmrhq
         agz7UGALJK3zyLRCPo45lF/Jvx4omNr1RtfOriscHo6VUsUFr9as3bQcofVfEEETDqZM
         w/Z9QPs5AEb6Dufejt3jsBZZlvvFTyj8ETf+URtafOEolu9wyZilstYZ9cCAQRBIQAdi
         ZM4rjaP3xTeJp1/HSeAN3S0TiUA1iSS13kX69R/tYjMjNghfTdCuaOE6Hti4uIb2An6O
         sN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758007658; x=1758612458;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YdzUgBNm+Fykgerb+7FYicUv4mSP6WHZUtexZFjMOI8=;
        b=uXWmU4zRaBqhp0w4LkKukZku+m5umIqbuBpLw0sQFw23djMkvZCMGzliWvjDnJOR7e
         3XQf2K0QLg7FVD+zP3y64tEgghBeLWRUpqCJJ8P5x/s0bbnB242qZVGIaq5MpG9FYwWa
         bp//kTKMqEBS8YxEynjOY01tQb8thn1d5a7aLbksPdues9LXHwNMthsYbB8hrRTZUb03
         zsuyJFbGFzdp4QxvfcD2+ruTRc+8rYjRzEMfZ3e0uaORMWann2hvIlOsGG0/3j/MWbFV
         3yQKbeXRP8fK5lWkUPVDfLWo8aQuJEu9jt9MomTCRqUSRXlsLsrskK9V5WZJEHqAVCRy
         TBXw==
X-Forwarded-Encrypted: i=1; AJvYcCV4JXC2gxyyusq+M5tue2AxUE+jptjX2hbpT2AZlC5SEchEpiZ5pT9IKjavLC8CF0FAjZBZfa73ZzTVTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIbaNOZLN0lohLKUSHRddjCDMBaphvCetholD6waToAE4l1kTQ
	IM0nzVVMNJenLy0eHPfu4pK8LCgao4P+dtB+MVYZmDbYcwFujjeEy8cGHqtK4VQThDRoI4gSG8Q
	/o1zsMzImmlRP6844IfB+BtbGMt1LitwO3WULVAz1bg==
X-Gm-Gg: ASbGncu9yQbBPMmBpNsIvgcBPbdKWlNnwqetootYAYQTH2dHNjZ4ldj1d4kuddc2TRE
	vkBz7E9WjrSy/Pcmo4E+vXPAYPM/twAc3dyHu/pbm/sQs1y4hze7yhmpIWKGemngcnZX7hFzyH5
	Zp+y/+MA+BiHn/dGCYo7jkEjgCC9ZnCxkJY9uaYk3Kbvz2NRAmED6jj9w2xexWryYY+MSo7LLEY
	s7LZx9dDr/KZp1cSlH5GncMtLoqSm4JvORF78dHY4IRP+0kg5l0cDAZIJ+PEIyBU6cCCwZh
X-Google-Smtp-Source: AGHT+IGaVagTx8hEuPpGoL7AEHAise+m6cLY73KC6Dl72g9vxKRp51S5NCherF7SA2OcxJNUcL1e+yLHf56LlaRQ9wY=
X-Received: by 2002:a17:902:d58a:b0:264:c48:9cae with SMTP id
 d9443c01a7336-2640c489f42mr117753185ad.38.1758007658046; Tue, 16 Sep 2025
 00:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Sep 2025 12:57:26 +0530
X-Gm-Features: AS18NWAma5_BQDQUJLHrWh8m4zqOKBnCdl8KRwcCODUf5Yb_JGvr-6H4NUsMNP4
Message-ID: <CA+G9fYuFdesVkgGOow7+uQpw-QA6hdqBBUye8CKMxGAiwHagOA@mail.gmail.com>
Subject: next-20250915: LTP chdir01 df01_sh stat04 tst_device.c:97: TBROK:
 Could not stat loop device 0
To: linux-block <linux-block@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, chrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Anuj Gupta <anuj20.g@samsung.com>, 
	Kanchan Joshi <joshi.k@samsung.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following LTP chdir01 df01_sh and stat04 tests failed on the rock-pi-4b
qemu-arm64 on the Linux next-20250915 tag build.

First seen on next-20250915
Good: next-20250912
Bad: next-20250915

Regression Analysis:
- New regression? yes
- Reproducibility? yes

* rk3399-rock-pi-4b, ltp-smoke
* qemu-arm64, ltp-smoke
* qemu-arm64-compat, ltp-smoke
 - chdir01
  - df01_sh
  - stat04

Test regression: next-20250915: LTP chdir01 df01_sh stat04
tst_device.c:97: TBROK: Could not stat loop device 0

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
<8>[   53.655971] <LAVA_SIGNAL_STARTTC chdir01>
tst_buffers.c:57: TINFO: Test is using guarded buffers
tst_tmpdir.c:316: TINFO: Using /tmp/LTP_chdm4pHJb as tmpdir (tmpfs filesystem)
tst_device.c:98: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:1953: TINFO: LTP version: 20250530
tst_test.c:1956: TINFO: Tested kernel: 6.17.0-rc6-next-20250915 #1 SMP
PREEMPT @1757983656 aarch64
tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
tst_kconfig.c:676: TINFO: CONFIG_TRACE_IRQFLAGS kernel option detected
which might slow the execution
tst_test.c:1774: TINFO: Overall timeout per run is 0h 28m 48s
tst_supported_fs_types.c:97: TINFO: Kernel supports ext2
tst_supported_fs_types.c:62: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:97: TINFO: Kernel supports ext3
tst_supported_fs_types.c:62: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:97: TINFO: Kernel supports ext4
tst_supported_fs_types.c:62: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:128: TINFO: Filesystem xfs is not supported
tst_supported_fs_types.c:97: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:62: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:105: TINFO: Skipping bcachefs because of FUSE blacklist
tst_supported_fs_types.c:97: TINFO: Kernel supports vfat
tst_supported_fs_types.c:62: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:128: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:132: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:62: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:97: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:49: TINFO: mkfs is not needed for tmpfs
tst_test.c:1888: TINFO: === Testing on ext2 ===
tst_device.c:391: TWARN: Failed to clear 512k block on /dev/loop0
tst_test.c:1217: TBROK: tst_clear_device() failed
Summary:
passed   0
failed   0
broken   1
skipped  0
warnings 1
tst_device.c:283: TWARN: open(/dev/loop0) failed: ENOENT (2)
<8>[   53.679564] <LAVA_SIGNAL_ENDTC chdir01>
<8>[   53.708246] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=chdir01 RESULT=fail>

<8>[   53.933883] <LAVA_SIGNAL_STARTTC stat04>
tst_buffers.c:57: TINFO: Test is using guarded buffers
tst_tmpdir.c:316: TINFO: Using /tmp/LTP_staPDxElt as tmpdir (tmpfs filesystem)
tst_device.c:97: TBROK: Could not stat loop device 0
Summary:
passed   0
failed   0
broken   1
skipped  0
warnings 0
<8>[   53.947889] <LAVA_SIGNAL_ENDTC stat04>
<8>[   53.974024] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=stat04 RESULT=fail>

<8>[   54.048075] <LAVA_SIGNAL_STARTTC df01_sh>
df01 1 TINFO: Running: df01.sh
df01 1 TINFO: Tested kernel: Linux
runner-j2nyww-sk-project-40964107-concurrent-0
6.17.0-rc6-next-20250915 #1 SMP PREEMPT @1757983656 aarch64 GNU/Linux
df01 1 TINFO: Using /tmp/LTP_df01.7pcwUXe1CN as tmpdir (tmpfs filesystem)
tst_device.c:97: TBROK: Could not stat loop device 0
df01 1 TBROK: Failed to acquire device
Summary:
passed   0
failed   0
broken   1
skipped  0
warnings 0
<8>[   54.060936] <LAVA_SIGNAL_ENDTC df01_sh>
<8>[   54.087630] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=df01_sh RESULT=fail>

## Source
* Kernel version: 6.17.0-rc6
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc6-next-20250915
* Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
* Architectures: arm64
* Toolchains: gcc-13 and gcc-8
* Kconfigs: lkftconfigs

## Build
* Test log: https://qa-reports.linaro.org/api/testruns/29896973/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250915/ltp-smoke/stat04/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/32l4Vv9hKep2EcmS18u3NBtmoAm
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/config

--
Linaro LKFT
