Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA4530BF54
	for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758905947; cv=none; b=RpE6HCxgNR8R45h5gi/v0kKUmjCnfl3egu2IZGjPNqKGWA3V3QmZ78iBP8h3apA3VH3M3KyYcziMxxKbu9wpz69hKY4qNcyYEP1HbepDhs6fOPv1TK1iU/+Pj6m0ut4ED708FhY+vIqfMiQbH6tF/Ng3qRsJAqXPHUTK7Xmwjls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758905947; c=relaxed/simple;
	bh=ZDbPNNwTc2xllQRq1upDRo55Uwg02Ak3IPmyPJuzBbA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=FUVn/P4/i5Ygx4BleFXwj5t7ug+6ourJFKsbaYsSJamDNyyNT5tESZ6MSpVaBzKwC1yd9DoTc1d2u7luC+6PCyaEYEOiqdcg/Dq/TiGoVD9JiHZhv6+ouQqH+IpJrHsrPpbvMJz5AFKpSjJeNA1b4pCWCw42prW/BhQGTgQRYDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Pl2tHZPp; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Pl2tHZPp"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b553412a19bso1868462a12.1
        for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758905945; x=1759510745; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9wF9E9YK/j++mNxViwWRBp72k3luVN6k0tCP2GBCao=;
        b=Pl2tHZPp0zzUhIwXfyX+V9kElwGW1JQpj7tmHcyQLxkiqpFxkSPU48THIXdxAkmbSj
         /97xbg2EaYohVftH98K1Y8KJaSCbNQ6We/IC96sedvL5nNMe5u0bDa2UxG0pLaETcNqj
         C4+IjaHOgpKTv0nmtM6BkADVn8ZwXI9bYjBe79tdYzcjKuGpvn1+f86H5nxofzfCJWA/
         GKjS+6DOsBDtVPmsyKriHowW+1MyKvTSVgFT1NrBNxNPCh2636bR4xdJsY6GVOfJc0lO
         G+REbbe7nTTIWJ+1PHq5p8eok+a2FqHpgTde+lnBO8CINlx66Ipwv0d0wxEqH4Woy5B1
         oIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758905945; x=1759510745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P9wF9E9YK/j++mNxViwWRBp72k3luVN6k0tCP2GBCao=;
        b=faqpn6iR4JsFKS18pUZY6vUZKTe5EljAvEgrCdXCEaWtvtuMc+E9kQ7WmZFhPt1fWa
         7qlM3Yh6/u9xZAnke5S8jpZsfGVkpy8eIurQCMNg6UfVxln0PL5TaDpGo0x4sfEtV/0J
         Cu5GmuSmmv+30SiRNpz1ZgOP3CXkAUKZvFCaXmre3w76tgVqK64hU1xKsML2T1SGa/Y9
         SFEr20lwVAFZ5Lg+9/1biFMX+HpCLf9nqZzlujJgYjzwKTJvQgGoqZyHWfQFSMe6mJW+
         H2S6dO0b5f7HL5MlFtd6440kyX3fvYfP6QazvZK5ET6Jb7bY9sBZFqui7IoZgzFsB9gq
         yktQ==
X-Gm-Message-State: AOJu0YwfJLOUJ5PgKoa3sC0xrTLgBpRnQYZGSsx13+cz7SJJEBtlB9V6
	jENEHJTLsgxBr28Neh2oQxG5Wgj45gEX3lOtV3ogyc/2UILTimZlWi3j0UvA+wMZlpI=
X-Gm-Gg: ASbGncuLCiEyYVLUZw3vOOabKSAJrRexiZNM8S2sVlOnZnMntGbIQ2ernHhClljiRaU
	MscPaK9OoVZC5xGOKfIPqsqFyngPEEpnZ6jOjjseK+PqMZpaH+IZ9NosJQX8gurN2fxLuGagiLR
	pzFv/LxbHT9V3Kfz3hH/4EBSPwZqzDUdTL4uoFeuCwc4VvFcgL40FsR8ntJ25gWp+rx3FBCpxEp
	k00ljXxzhVmvKMJW34vtoJOAYjCPLtJWz5sv0nLsjuTPieIljnZcPTFueRHHF+0ri3CeNCL2fjC
	8wUvK6eyNmEbSJcRbzd/COho7p65m6+dgjs43KDNv5VsyTaPDZlQWzvbuX9b37VgxwHeATBzPj2
	A30nomCksnV/A576v
X-Google-Smtp-Source: AGHT+IHycoCoJVtt7eLBZ5+vov4fPQxkaAKP2taxHWvQsxcB8inTLrOdpSWX8yxl7Zgh31ey59uNrw==
X-Received: by 2002:a17:90b:3c83:b0:332:250e:eec8 with SMTP id 98e67ed59e1d1-3342a26a9f6mr10387874a91.15.1758905945085;
        Fri, 26 Sep 2025 09:59:05 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a3cea96sm3023020a91.2.2025.09.26.09.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 09:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 26 Sep 2025 16:59:03 -0000
Message-ID: <175890594293.1628.17920768087361832744@1dfac204f25d>





Hello,

New build issue found on next/master:

---
 undefined reference to `pm_hibernation_mode_is_suspend' in vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f
- tags: next-20250926


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: undefined reference to `pm_hibernation_mode_is_suspend'

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b

## cros://chromeos-6.6/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e


#kernelci issue maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
