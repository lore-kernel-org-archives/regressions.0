Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41333DCDBA
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 07:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177497; cv=none; b=rTxKq6nsjAmLXyZV/IWg+Cjdn0kbVM4ocV/YFiFaxdMB/v9Vvjfvh6Zw/fUZEqNpVmdEup05pGjNk/iZTi55gw3phjH67dLDZXFeEFSkBeufxDt8j1FrC2uJcjo1b5FdPiIhO3NRMI1ww7p/Aoe/HreYwU3r7YkENLNBRf/99LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177497; c=relaxed/simple;
	bh=TZ0RN3qnNzUPKYI6sc0z1cZ1dFrGqG8XGPMWNd6bguI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dP/Ysa8SpjLIDLEIGNcNjO+W/AFPyDDiaePig8hvE1XL3YRgHhtybPwR8Lqi5MH1bkm0bcOlr8ZiwlUfRvIjhqOoINJK5IVg1Tnn2SF/8v3WckHvfmsfz7UdspkIbqfVojoVSdl2saJoyJEyFDTVaVa8avJM2K8GHqJACCwm/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGM07DYn; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGM07DYn"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1309f4ee97fso3540665c88.1
        for <regressions@lists.linux.dev>; Tue, 19 May 2026 00:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177495; x=1779782295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7SDGHJz2p+KDEC7XABBWobKGkDCgsLu+7qpYk+YyVw=;
        b=eGM07DYnXTakiVEQ8XteXVQ0ypbOucpPDbzZ2Mm6Au9iMmHT33eO2x8ozBasCyQGLP
         OMli6n2WedJGu23HOotR9O+q8os/ckKX9tQ5v9OkaUcjZGIhf9iIhastGCqa2P/sD/jF
         8JYORRtbBSXSqxBjSQBKyVdN/4auZ91+TfG7sSrUond33GRCmiNLUIezAX5mBIJdpUIG
         oD5aIpfNMJ+wE/mcbBZeSXA9zEwoC7x4Z8y0AO/dt4OCaJ08cdv6XHADv8Ta6jEDPAz7
         26MvZgBEv3TwGmBT7UGdn8kpWg58zIC9wXot+YGBccVWnk21vKTDIwX+300AryaRlu+v
         2fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177495; x=1779782295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7SDGHJz2p+KDEC7XABBWobKGkDCgsLu+7qpYk+YyVw=;
        b=VPviTLtMIlccm85Mj9P5WAh3xZSbZyxlrtcgPKSimLPLRa9s7V9tMBggf1uTpA8yH+
         rnJ6iRR/8epuaqWbe2K4Nif2R1OBleCxSJyqlTHs+DqvcMiNwIvjdH5vXxF6QkHMeVYF
         CMTgYa7NBfEcAKmhYbcqDliJff5ZMKWLXjAwXi4LHsxK3x0VAE3d3dV/3uiL/CWB2YHP
         TOx/uNgHAJoAm2Z8S1Zgz5ANqoi8SrnMY6IrEvf2bFKhiBrtFZ1Y00WWXBpzRMX5Iglz
         eyItv70N/LThqH4XCrMkL/k6/o8T3g/gHZ1xvJUQo5Na31WNvfaWrjdMtd/kVdNKWlwU
         SgRw==
X-Forwarded-Encrypted: i=1; AFNElJ/JGmtDXaPYkqcO70r79YOHMaErhVbaaa9X/xAnhSknk5lAnGlXYCUtW8KTsZYTMCSUMfN8GRhe/Ctwog==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMVrxQ59/rFsrCU/U/SskxrJsVybsn9NlojKxXXIkK8uBq1ez/
	1butByqYoH4mWkcCHr4lQwnQdga/2o2cuFeHZRgTnZljZTKCfUSkHPXg
X-Gm-Gg: Acq92OFNUyIzmiZC3nJFC+ZbJS8icfA4OHmBhiOjwFdyS94wf+2R4svwSWMbmwHBZE4
	xksPqQSUMxrRkHK41TDvsBlSk6JvoOxe4fBTNVtB0dcmhcO8hUyHum/AgMztl+pL+MmBUT4qfeR
	qqLUXPSklNBe0S/vYYBtFsiH1ssxbXpzFOlZ2aZOiGuvh3ZRdqj0HUjju9vyc/HQRdyfaXm+Yb3
	65GvXBJ8DvQ7kRiuNrl4ht1RfaPWoOyH4u7gKtvrR5vheIR36wX8ufFouF1c9UQovYeVXOAGmUH
	b9gGhlpUXQu6z/RlrKk42nUW0z7HFm8+9dAKEp7pZsD/iX001l5zB+IKGNcgUxcXfylGBruUiXh
	wWNy96PPXAZ2x6CsM3ahoWyRyrOFWwXgo+FphHNNLvNPT8fyhCZmfhA+RVF+SaxamybbzONkLuZ
	UnvUesYehoElbyQ9LLq9YDzacMQrSv6K8Nud4L
X-Received: by 2002:a05:7022:6082:b0:12b:f616:1a4e with SMTP id a92af1059eb24-13504740a2fmr7096626c88.23.1779177494893;
        Tue, 19 May 2026 00:58:14 -0700 (PDT)
Received: from s7t7-debian-test.local ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cf44668asm18768901c88.6.2026.05.19.00.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:58:14 -0700 (PDT)
From: Tony Rodriguez <unixpro1970@gmail.com>
To: davem@davemloft.net,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	andreas@gaisler.com,
	thuth@redhat.com,
	regressions@lists.linux.dev,
	glaubitz@physik.fu-berlin.de,
	unixpro1970@gmail.com
Subject: [PATCH 0/1] sparc64: unify thread stack sizing and add explicit 32KB stack
Date: Tue, 19 May 2026 00:57:54 -0700
Message-ID: <20260519075809.8993-1-unixpro1970@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch fixes a reproducible stack exhaustion issue on SPARC64
that occurs during USB hub enumeration. This regression may have
started sometime after kernel v6.12. With the default 16KB kernel
stack, the following panic is triggered early in boot:

    [   25.528399] Call Trace:
    [   25.528403] [<0000000000433cd4>] dump_stack+0x8/0x18
    [   25.528419] [<00000000004297ac>] vpanic+0xdc/0x318
    [   25.528429] [<0000000000429a0c>] panic+0x24/0x30
    [   25.528436] [<0000000000be2280>] __schedule+0xa8/0x7bc
    [   25.528445] [<0000000000be2b60>] schedule+0x24/0x4c
    [   25.528452] [<0000000000be6970>] schedule_timeout+0xc8/0xe4
    [   25.528459] [<0000000000be3318>] __wait_for_common+0x78/0xf0
    [   25.528466] [<0000000000be3550>] wait_for_completion_timeout+0x1c/0x2c
    [   25.528473] [<000000001005e2f4>] usb_start_wait_urb+0x68/0x128 [usbcore]
    [   25.528502] [<000000001005e468>] usb_control_msg+0xb4/0xf8 [usbcore]
    [   25.528518] [<0000000010051180>] set_port_feature+0x44/0x54 [usbcore]
    [   25.528530] [<00000000100530f0>] hub_power_on+0xc8/0xe8 [usbcore]
    [   25.528543] [<0000000010054fd8>] hub_activate+0x12c/0x644 [usbcore]
    [   25.528557] [<0000000010059438>] hub_probe+0xdd4/0xeb0 [usbcore]
    [   25.528570] [<0000000010062360>] usb_probe_interface+0x234/0x26c [usbcore]
    [   25.528585] [<0000000000a10a40>] really_probe+0x1ac/0x3b0

This is caused by large SPARC64 trapframes, register-window spills,
and deep call paths in usbcore. A 16KB stack is insufficient for
this workload.

The new logic is:

    SPARC64:
        THREAD_SIZE = 4 * PAGE_SIZE (32KB)
        THREAD_SHIFT = PAGE_SHIFT + 2
        THREAD_SIZE_ORDER = 2

    Non‑SPARC64 with PAGE_SHIFT == 13:
        Retains the existing 16KB stack behavior

    Fallback:
        Retains the existing 8KB stack behavior

Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>


Tony Rodriguez (1):
  sparc64: unify thread stack sizing and add explicit 32KB stack

 arch/sparc/include/asm/thread_info_64.h | 28 ++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

--
2.53.0

