Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792495984;
	b=I7PEyBWOS6wFeEVPVFL3uClqX7r+m7G6/yKQtGKvRXIex0IuMu79h2SAoio7y/HMI39t
	 yrTKdZ5/wmjcO8i+mcx0/52ME+p2jvbD3dLNcWS4JIGIS+Gi29NXt5N5P9bBfDJYOV28Y
	 PAcBOJ0Vc/MAp6+uBPKm1lpJSR+yMmzNSYiWvAEJsF9P0oTeffDKdFVi4uj7yz/QoeEoD
	 vs8ycmoOjYw+aa91qe0/A31eZO0fdj8fwcd7ni0RRx+CT0pF2VA1fK4FS6t1YfboG8omm
	 1VMba4IMNKofmayAg7lNLt0+VmCyVKT3GE+nfa6znAWpCWrfgZw3BUXwsbkSfFtH6eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=6w7JRuFovvwwUBTh/FtHv2xuiuhqO2jha1lfwIcoggA=;
	b=jB+z+Sq0BHjlMYsxhOaPLbPCDAfWHVdpXp+OS0a+kTP1bP7J+OhUNPdjYKDhLsFIj8Uj
	 XrjANTE0U7nb1/By2NycY8oWT+rME+XBRYemLfW/7prFNigYggeMLtT9h2YioesH3PPuU
	 zbbXclGD3LNuVZYbic3YQP1UY9sukGP69QExj8MCTGYxiA6fTirQj6uCDpSoGFCoAfkHc
	 qVv2kXBNUbXY481FXmZGEdLzuoUMOc4p0KjkedRReO5Y+fsZN5Oyb7pHXuWfHPBIX+nJR
	 SFOvqMLCi+obFk/LzgDw5PuWEF0ZuEqcRSgPjA7yMlIsLPziC0oR0jURuWBVHTLt5yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kiddier.org;
	spf=pass smtp.mailfrom=kiddier.org;
	dkim=pass header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b=Kg2eU5L1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C45606A31C
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 11:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C45606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kiddier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kiddier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b=Kg2eU5L1
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ead4026fe6so591850e0c.2
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 04:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792495983; cv=none;
        d=google.com; s=arc-20260327;
        b=E3BGgI7xebDbZD5g3FbNhOItegeNUuhQPH2jxf9mdlbqI5izP5LMeZWy1YLP21tnZe
         qNht+Hi+AKRw7nxWe/9u1l00bNKGVqb654giiW7LumPoHvG0AXFlpOVioI39iFft6OsO
         TS1dc3UogqeRCymtlr+74OP22YmevGhINFTwBZNFpn4dVhbgGScdt+4u1/V7YDLBV/mY
         KT/zfFLKIhqDd9IG5DL9BuPfe1bNeKRXgH3i0e4dPEZc9FxYSYCrGo2SPPH/j8MzJeTy
         JF9BFJHW/dXby+Zk8JwqUJ/eLMmXSTr0FT8XPKsyzRhaL4UiTAcVN1iG+gPjT4D8gBR9
         mXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6w7JRuFovvwwUBTh/FtHv2xuiuhqO2jha1lfwIcoggA=;
        fh=wyB9wjTh2jd2GkFtfPluFs9ogqMC8jQxzsUwg+xfsqQ=;
        b=CHLaP7VkyYlux09PNJHIAd9EaKGVyUWOw9dJIsuaXtOxB8sVnkzmlqR4JQ1WdOH8pj
         huSRX3Y9Ih9RzngPTObaLdPV8YYmEDHvKsdFd2WulmWUYjjbcqj6DQI2VwRUD9mbuW32
         cXFhLLEg3IoybnM+Xg9GUF7mD+b/QC3QOVSuHj6iwfukxwaa61tSCJFn2/IetrjkrbWY
         f0uVt6G9QP4FKOuJ06gu5DevEV3zv5esaOJVoQzMxrlZejxXdbbbHW+hDiighBUV9Dip
         gl1GS1EBWbSvCNijCVWoPpyrp9IXU2uI91rm2yKuId+qQZ4EDyQnlQO5T4vFgLD09Ibb
         6aUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kiddier.org; s=google; t=1792495983; x=1793100783; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w7JRuFovvwwUBTh/FtHv2xuiuhqO2jha1lfwIcoggA=;
        b=Kg2eU5L1ZH1/rhyBK1HBZXlrJ3dThch+WIhyXGs/eDNfqSCXg4Cpdw861WyMrsHEqQ
         RGhnrBOp/up7ePk56uyKQPyWbzpmvQ4vQZTWE62gmhZtDm3vu8wn2nObjH1KBy6lOYiq
         hxrx1yEV5BQthb7uNJHUwRBSEMZT+k4K6mork=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495983; x=1793100783;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6w7JRuFovvwwUBTh/FtHv2xuiuhqO2jha1lfwIcoggA=;
        b=gpKfp8OurvAC4pNjpq2G+sJTq6AZLt7RJHKAR+mlbsnT+MQcWa59iAqvuidcYj7sKL
         9vmxYnZ8tOolnFak2pi71vX0Ed+9E9mVFSXA8OU0pHuuCn/U0o/QvmYQ0KKlJXI86uek
         iUC5w7Dn5r7LlTV0SMTLgsVaZClziRhIyfA0RQggCFSJ4hGv0V7F6k1RlEH7zMXRM3T6
         QF6obFCPH5wuVa85gCp4HR91DRbuoCZM0VPol8umwV1vAdw3NhMnVB9dbBDx9lpzTNrl
         R9QLvCwtettmQ8UhLQUlxuwQbbYKPxP9lx2IbtCvimcn53KjflIy96vRGOO8K0nRPHae
         ba1A==
X-Forwarded-Encrypted: i=1; AKwUvByVTmHwf+N8vwFZOBTnPjhwH90Shq67pLJSuvFNFmtet+UKF6KEld2Dl44nDWOT/YdFlFV+M9SuPDhLxA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJsqCNBWAvCTD+y1xDmXJr/hlURppYNznpGleE7oYjE3772c9WC
	oSP9v7N/DL57mCb3pCQEmPGI0rLeKVdD8Jn3ISicBAIpivpVBFld/KwM3UpdIGzaK+r0wSwpzyb
	9t3vZcckKOZiuk4wEZWXtsg5L915YAB0TNoaeIBDXrQ==
X-Gm-Gg: AYBFou2HY1wmzJRe2hqrBlgvjD6LYxVOBaw8QJt/ynIOGlOUWZjMWDhqIxBdAm3TEqg
	1UrhkanzVUWWCsyfF9eQ6CENiblrlrfg79fPqcEAUUY/INT/9OJknKye0WMe4fU1NKH8CtykWor
	VpYY+ghVZNH9yxAHrs9MymRbNGyJsH5D45watUnw6SaRCcfc7t8/p/aUEkIDiJ5Fb5PMThBCua1
	/RnTlWJCDQSTZLkIbWXJnX34ajMhZepUH/oJ6/qKw2pJv4EUWsnqLvDEyClDVsKbXoxD6dlPlpy
	gJ0f3+pnJu3Sf2xY3XK+JvvJSH7eL/V8iGhWy+iolcMa1QXTZWba7c1ueA==
X-Received: by 2002:a05:6122:4307:b0:5e9:7458:9bb2 with SMTP id
 71dfb90a1353d-5eaaa392b1emr2875328e0c.5.1792495982934; Tue, 20 Oct 2026
 04:33:02 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Peter Kiddier <peter@kiddier.org>
Date: Tue, 20 Oct 2026 22:32:51 +1100
X-Gm-Features: AclHuK_5AI531dlJobOpneIUNwUkuWTyVSnUQajyWhdToxWSB6hT9Bldv5uGkoQ
Message-ID: <CA+3E589O46nj=c1Y+Rwk_nPZZKEUjFvMfWaAFmQ2-7De9iUxFw@mail.gmail.com>
Subject: [REGRESSION] BCM4355 Wi-Fi fails with Intel IOMMU on 7.3.0-2-t2-noble
To: linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, iommu@lists.linux.dev, 
	arend.vanspriel@broadcom.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting a Wi-Fi regression on a 2018 Apple MacBook Air with a
T2 chip, running Linux Mint Zena based on Ubuntu 24.04.

The Broadcom BCM4355 Wi-Fi device works with kernel 7.2.11-3-t2-noble
but fails with 7.3.0-2-t2-noble. Disabling the Intel IOMMU using
intel_iommu=off restores Wi-Fi on 7.3.0-2.

Hardware:
- Apple MacBook Air 2018 (MacBookAir8,1)
- Wi-Fi: Broadcom BCM4355 802.11ac Wireless LAN SoC
- PCI ID: 14e4:43dc (subsystem 106b:0843)
- Driver: brcmfmac
- Interface: wlp2s0

Test results:

- 7.2.11-3-t2-noble, default kernel command line: Wi-Fi works.
- 7.3.0-2-t2-noble, default kernel command line: Wi-Fi fails.
- 7.3.0-2-t2-noble with intel_iommu=off: Wi-Fi works.
- Reloading brcmfmac on the failing configuration does not restore Wi-Fi.

On the failing 7.3.0-2 boot, the driver detects the device, loads its
firmware and creates wlp2s0:

brcmfmac 0000:02:00.0: enabling device (0000 -> 0002)
brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4355c1-pcie for
chip BCM4355/12
brcmfmac: brcmf_c_process_txcap_blob: TxCap blob found, loading
brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4355/12 wl0: Jul  8 2023
17:49:51 version 9.30.503.0.32.5.87 FWID 01-e74b9cb0
brcmfmac 0000:02:00.0 wlp2s0: renamed from wlan0

However, Wi-Fi subsequently stops responding. The kernel log reports
errors including:

brcmf_msgbuf_query_dcmd: Timeout on response for query command
brcmf_cfg80211_scan: scan error (-5)
brcmf_run_escan: error (-5)
brcmf_msgbuf_tx_ioctl: Failed to reserve space in commonring
brcmf_cfg80211_get_channel: chanspec failed (-5)

There is also an error creating the P2P interface:

brcmf_cfg80211_add_iface: add iface p2p-dev-wlp2s0 type 10 failed: err=-52

I tried reloading the driver using:

sudo modprobe -r brcmfmac_wcc
sudo modprobe -r brcmfmac
sudo modprobe brcmfmac

The driver and firmware loaded again, but Wi-Fi remained unusable.

The firmware files are present under /lib/firmware/brcm/, and the
firmware version reported by the driver is the same on the working and
failing kernels.

The brcmfmac module metadata differs between the kernels:

Working kernel 7.2.11-3-t2-noble:
srcversion: 3B6176FDB720DDE8E7C596B

Failing kernel 7.3.0-2-t2-noble:
srcversion: 3DCA38D52402541701276CF

I did not find obvious PCIe AER or fatal errors in the failing boot's
kernel log.

It has been suggested testing intel_iommu=off after reloading
brcmfmac. The driver reload did not help, but booting with
intel_iommu=off restored Wi-Fi.

This strongly suggests an interaction between Intel IOMMU handling and
the BCM4355/brcmfmac driver in the 7.3.0-2-t2-noble kernel.

I have not tested a vanilla upstream kernel, so I cannot yet confirm
whether this reproduces outside the T2 kernel packages. Unfortunately,
I have limited time available for further testing, so I may not be
able to investigate additional requests promptly. I wanted to report
the reproducible behaviour and the intel_iommu=off workaround in case
it helps identify the regression.

Could you advise on further diagnostics, or whether this should be
investigated as an IOMMU or brcmfmac regression?

Thank you.
