Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792911547;
	b=qj53o5ChZefMFbW1Br+0okbx9c91j/9ktMRrVqDxwjUAMdxzjgs7ju49o2RxeiPhM23h
	 fsBRh3nk22VirRt3oJboCY48svdDIWpnvZtY/Z4NuHi7EGq+1q7MEF/c6XpfR3AH+iops
	 9Gyz56HQV0YRdSAoRhZYyHGA+IhczTv463KLb5Tcknq6PVGTTH/+Y4ODf2WYILloRe9kE
	 90BDvlwKOsFYmK5XWW5HG0belqQ/haer6H7DV5MHOXL5Of+CkzQURoV/UCwQ/aQ8CPH7w
	 v/R8UbTA6ok82LAQYk6k6erjkNd/4J0gpBiVgURxGhUf3mFYBs7lxPXEmDlk4ludmYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792911547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=PXTc91qXvMTsxQesj+cDbe6Sxgsq2vBrnNPGYG1eSIU=;
	b=f3UMx61x9FPIED7TG0t63Pm30fpUaGsQ91D0oSpIP5OfSOkmW3lGh24kgcMLcvxLOXWJ
	 hX6YxK10KWTZHENDZdkymG0UkvijjVWwG3mDRmGCiKevEPiEnD2/AFtT1NcIDMKZVgFE8
	 UbQajEU9xWTrKPHOT/KUWkcTQWmal43UThZUeUAncokGHwGUoitEkOw+DiOytzegLrxcl
	 bdkdyyyywesvrasPcT6e7wz0iTvCXY9UMX+tLXy4jEgWv52D68Ukv+4tsg5HBjECLCgDV
	 rFXaE6wECUwJmyAhl3PqYYoyxWqGayFainmS3O79OWvthMUgUNnebpQFiZ3K6mHU1+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=X40CoBW4;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9CF606A31A
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 06:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF9CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=X40CoBW4
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-185fd3a4ca3so1513507c88.0
        for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 23:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792911546; x=1793516346; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PXTc91qXvMTsxQesj+cDbe6Sxgsq2vBrnNPGYG1eSIU=;
        b=X40CoBW4HYYRsC8T5fg8Cei4ZA2r5XUl/d6ZaD7e76n6ML/E8mawLQpKQYLEWqZzwa
         wTNR074RQQ4U/aswPrAHf2Mv0Q12tcwYrHybuQh2Wm9XPbKfiH4qe2uQQq3+4on8lPH3
         XhWJM4BpydWep1j5EtfYD+UDuWEyqZ/a8Ub6/iDT+hCgjlzdTLvFTTpRUmvv751tLLAc
         tUfd3p30pQiwA370vdCghkuc3awMeEYwfGM5RIP5htBt6l6ETydrk+qids3dTsNZI0ND
         UHXwvFBcVMCQHjD4F5J4ZCGtwzWe4y3whWyT1FOVwg5p52D/2K5tb1E33LDxxvwOPpmd
         n6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792911546; x=1793516346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXTc91qXvMTsxQesj+cDbe6Sxgsq2vBrnNPGYG1eSIU=;
        b=FF/7XmGS0wP6+xQzWTv77erc2Dvbbo/rXNErrWKU3fAY3mYCsviOawvZMHLsXn89RB
         hAKWAc/XsWcBkkCGSNCXGVVxjkCatwksgg9Zv4tSUplvmddK6BnlwD//H2Vk91KyWo14
         oNBvnldo9Q0bNAZYL34TU72C0O9d3dGfzF/4J6Pa+8N2PE8AvrPDDWpNK2cYNaurHUb+
         +D4g6jMZ2wLqlzKVgUAlwes/n88TicLGUMzHpZ2qDBNQGqBWyBJ4FN47PqxNWKB81zga
         VMxFZNVi1AxAmUqfaqhfAyL7zauPN6I9muNKHhZCOx/f01xkoWxBROTCBPcuJo8Eu/yx
         zNIw==
X-Gm-Message-State: AFq9FYKU+kdkP1nyF/qU3teR6DVg/umY+c0oCB0dAkPhgaC3AyzNMxxt
	+31KZiFsWJ8RBQKfoyiXIMFo5LLmas18ra/QfIlpArhBaoEBw/3zQrTTOOYjz6NfkFE=
X-Gm-Gg: AYBFou05ZTW+UB3bi3+qy0MFNPJ1aOK5YlZo/L/pPUp5oGkkk3z429S5yfcT0CLh+eC
	9EPTCvLsgiUThLGh7nZMDHN4Fsn3i/rLktCjfG+v2LRgk/oLnkHraEoHTVaHDHe560XSeySeFIT
	4Au0N9LdLvVawm8zFkUFn+UiyVPJZOTj375kx7wbRlnZcvTAG1soRDIO/4SM7M2lvdkIZO1D41h
	FfnhVVQEKbKXaBSIDXPC2iDJ2N7RbixZyvjVVeDIaoeJu2XnciEOjxNNksdOa5TGAzSwAe7tLsf
	riuzgSxE8PYf55dzlCF4KHC1mjd5bB88vX4Ll3GeYxNHT9Nxm5CvX/EcDF2V/vpA9Pwbo1olFEN
	zMqJOYLocd4j9qJ8R5PVNJwBYnMY2qUIsktxQk6sntFoH6SzBoMUy5OY8+MRhr58QYvPGlpDags
	wp3N63RsBWhrjQMTlR0IyUeTEZY+6fz6RTtJRRwPYQgvqfmMvrskQqg00x/4MH/+6/409u5hqNI
	h3rP40ALrjP5OCxFMRH+nY9VAt4THqRQbS3r9pqq+nvu/+N
X-Received: by 2002:a05:7022:418b:b0:143:298f:33b6 with SMTP id a92af1059eb24-1993f3ecf66mr8157242c88.46.1792911545687;
        Sat, 24 Oct 2026 23:59:05 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm15391185c88.6.2026.10.24.23.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 23:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_mainline/master=3A_=28build=29invalid_use_of_unde?=
 =?utf-8?q?fined_type_=E2=80=98struct_acpi=5Fdevice=E2=80=99_in_sound/soc/so?=
 =?utf-8?q?f=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 25 Oct 2026 06:59:05 -0000
Message-ID: <179291154395.445511.11371466163163680530@kernelci.org>

New build issue found on mainline/master:

---
invalid use of undefined type ‘struct acpi_device’ in sound/soc/sof/amd/acp_asp_mailbox.o (sound/soc/sof/amd/acp_asp_mailbox.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/sound/soc/sof/amd/acp_asp_mailbox.c:59:22: error: invalid use of undefined type ‘struct acpi_device’
   59 |         handle = adev->handle;
      |                      ^~
/tmp/kci/linux/sound/soc/sof/amd/acp_asp_mailbox.c:42:25: warning: unused variable ‘pci’ [-Wunused-variable]
   42 |         struct pci_dev *pci = to_pci_dev(sdev->dev);
      |                         ^~~

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179291154395.445511.11371466163163680530@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:098e18f2efa71bff9aa46f270f870bcb0dbc481d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  a32e63a613aa80dfdb9acc0a09efab940e96054f

# Builds where the incident occurred:

## x86_64_defconfig+allnoconfig+kselftest+x86-board on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6add99bb55fda5076084de6f

#regzbot introduced: 330517c63aa9b48227b6ab45f01003effac77ae4..a32e63a613aa80dfdb9acc0a09efab940e96054f
#regzbot link: https://d.kernelci.org/i/maestro:098e18f2efa71bff9aa46f270f870bcb0dbc481d

#kernelci issue maestro:098e18f2efa71bff9aa46f270f870bcb0dbc481d

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
