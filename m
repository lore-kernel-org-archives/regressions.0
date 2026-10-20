Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792496986;
	b=DhqbTKpJxp9BOKxNlJ9SW0rRaKVCOZd9ZZN2N6iZcL9imffkJ/92Ufpvvy4hImNTJ6la
	 gucg40GUYGjLOYnc8Rym+Jk2B2qWk/ez3/HC8P8ECeroMSi4GxOvqKYavarRVRXbO1wAc
	 0uyS114co+dVKFBPyMLfztEjNKsGBpgsYza+xfKK8ql+f4NRbkN9Lg2sZLX7x90FHmJbc
	 3MJ4KTFZxD/5apWSsABZpJAOvzJ6Cwvrj3cVUTY/GD9NJo5E1OOKnLP3a+8FKVqBBGAXJ
	 2DaFlP7245GLqHbt02gRM2UyTIpX5ic4T+sVY+qXDy9DmjLG2/Ys179lb+7gq1m7gHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
	b=XmaNBK9q4b+yDkt5oxgpRnyYGM28mWapbOPEjEjtj/8mW5SCGlGX79GttIRfjIpBGbqK
	 GXRSAus44kOb4lS0bnJK9M2/7tKG8Zz1eoHAcjnMqTtauhk50AOgXzRXQYsuhMIM4/k+x
	 jtBPS/OqST2o36uJ8h9O7Tfa2rFknZQObJRR26jB4QaP6xxKXdswLEI/a69iATj7j/PLP
	 XhwguZGTk1wPEkUyto99R5sOqx3nwDhw5ZIX8Do1e018che9byGBG9g2mXjqNeJ493QKh
	 HXyJLSVpUlnveU9fbgBajBZK3O3KCwQk8sVNk/f8z7doVaxFPdxin4iGKW8PCshxmCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kiddier.org;
	spf=pass smtp.mailfrom=kiddier.org;
	dkim=pass header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b="P/U5Q2Qu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FEF606A31D
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 11:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FEF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kiddier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kiddier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b=P/U5Q2Qu
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e941201909so945337e0c.3
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 04:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792496985; cv=none;
        d=google.com; s=arc-20260327;
        b=Yl2etUOwADeM6egwDd05QN3AYpexiXRRma/zCXUcC8j3iS7flTc0Gs8QTA+kPZa361
         w8E/hht7EjlPiSI6BSDwh6GF5cNO7s0XHfFvhv9efxZXJIADQQ1k/Cca63ObDJqKMfc3
         Hw2TVRXam8gDkVCqCXeSYeQksGRaSdq+j10kEJKCwC/Z5wKKQg2WkkhQWOGH9zi165XA
         UrhFF+NARUbIh/1eo2ylvn3tOg7aJMg/W7RkiEBsjTEU8oai4oWyfDvm95ZB/1wZYZGD
         1D4wfbHmFUjClDJ/t35YqbJ2WWLp9dT1+v1CmzRDCoeS+Fz9uYeSFIZWfNj1q6rOKknm
         OqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
        fh=skWnpgbiqiVXFnBjR7YHUzB3tHnoOijQad/YpVfQVLE=;
        b=LM18jCww9MyHVdMQWnTi5m1QhlPxYAhX68+miNcH3GPN8u1ev3llf03+/hr9gSAWph
         OVqfpzvicbv5dKo5GhTcJLkAU29G5IEHrbvirlALnQ/J4//UsUY8FSz7ButeMy+HHpDe
         FG434DzeyaPbVl8llOZPGGwlIWjmt6S3TKOgWl1LIf6em7iCH0ecufqYULaB+/8AES4p
         2YmQkvdrelpSBTlG1HzHqkBo9A3v1GTCi6d72snpcCjCYF8T8Hgbdc5uSHpzRWtWEfxe
         EBe7KV6jEa7uUgieBHz/rZV4sIc1Qgh5DIEGeVMKOs3vrCWo+6Cq9OahfwDVrYea95Co
         8BmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kiddier.org; s=google; t=1792496985; x=1793101785; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
        b=P/U5Q2QuVUDd1Un3eSLXVWoANCWilmXwgEvWrdteXJQ4Enf+zVwpFY07RNGUDSi06m
         jawhPcM4C42kA9OMWqcDmvDXyFz0fwg+F6Of3MGTrUVPUUk2mDfr7lxya5qm2z++Qeim
         WfVrm1bvVSx21f1MV+3FNvZaNLy8sgnYJRWKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496985; x=1793101785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
        b=ooJqMHUYD+MeZ2Xsi2XFoX+Py2xsTAjTet/TZ0ehZuWna+iz8OJ++EB/TQ7eMqmKbw
         f6/LmOj7zfekY/kMVMkP4/00deeGIrY9uj5kASDEcCEnTJSSq4G3aCpyOcf3PlKARMQf
         89N2oyoQCc1iWgja95wZ1FUqY3EnSBcVyzk9kuKUOXcwzxzUrzhExHArOBT2czDVMQkM
         UaOcRizbeqbvpYu50EdUOXAoYOvaTOCL3BgdAj8ONHNHHW917trbJ7xDQQoqXujT9508
         RwGBr87clWv8XVXnlsU+caTT/yTCjAVT2TA5uYXL6yJ6weDjQmBKLn/zoC1CdtTm0shD
         NrjA==
X-Forwarded-Encrypted: i=1; AKwUvBxgQ9D7Tnn004hbW5JLSGkzGNca/DSz5ihY6Dzs7Anq1C3wiwFWMFMgfCvNxPXNWFIrE6rphOlhp9dbNg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJD9ksV0CWb1HWRuf8T/unFI+u6MQp+HhkvRXWtDgiHE0DWkmYY
	ZY1tbzJFx8CN+iJBPKRQlivvWQCSWxaspIb5w6kp7vyEyIZW5ilf4xts3teNDUsZgwYuf6zSWyM
	LXVwcEacXo1LX2IHcLmgiQ0r/mvzMthkB1BB3U8J3gQ==
X-Gm-Gg: AYBFou3TMI9/Ue6yITYncYYxBpQuRF2uPWOgpjyomo14DfwsaYRnQ5AYlpK6JtO7pp2
	9pGqUzLzShePxpDuCYXh/ZXoEeW2v2YKOERcGYCmZX3GgIxuhs5Gsg1B61RYa4b9mD5IwlsBxeX
	lXIxBf3QS4380oaY47FCQa/xfdHK8HQNSEXwcfe8mOByngWBm3AwibMOI7qAYDY3TjwKHKWM79v
	m5R/Ut9aDeJEUghEKaJQ7YngC6KbKzeTm8Izdz30PL5dQ3OoZMArjbbMFfg4tIwipFz7zIuOzOG
	z6t0omTAkhKcalosZ/Z7ljxy1AKdzvyefjq7zmM0KxXXLVYhK4a5bnNouA==
X-Received: by 2002:a05:6122:8c1:b0:5da:9b81:1aa4 with SMTP id
 71dfb90a1353d-5eaaa3c174cmr3451932e0c.5.1792496984909; Tue, 20 Oct 2026
 04:49:44 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CA+3E589O46nj=c1Y+Rwk_nPZZKEUjFvMfWaAFmQ2-7De9iUxFw@mail.gmail.com>
In-Reply-To: <CA+3E589O46nj=c1Y+Rwk_nPZZKEUjFvMfWaAFmQ2-7De9iUxFw@mail.gmail.com>
From: Peter Kiddier <peter@kiddier.org>
Date: Tue, 20 Oct 2026 22:49:33 +1100
X-Gm-Features: AclHuK_KgzridKLRANvtLJkSHaLWJWHnmxsRRdoNj6COaR_e09DKIcJwjLUSHC0
Message-ID: <CA+3E58-2N-uVNsmwvOGDKZvtnDQ1DF=GzFbTyRLuN8FpAd4qdg@mail.gmail.com>
Subject: [REGRESSION] BCM4355 Wi-Fi fails with Intel IOMMU on 7.3.0-2-t2-noble
To: linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, iommu@lists.linux.dev, 
	arend.vanspriel@broadcom.com, regressions@lists.linux.dev, jgg@nvidia.com, 
	kevin.tian@intel.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Adding the IOMMU maintainers and linux-kernel.

The original report and test results are below for context.

I haven't tested a vanilla upstream kernel, and may have limited time
for further testing, but wanted to share the findings in case they're
useful.

Thank you.


On Tue, 20 Oct 2026 at 22:32, Peter Kiddier <peter@kiddier.org> wrote:
>
> Hello,
>
> I am reporting a Wi-Fi regression on a 2018 Apple MacBook Air with a
> T2 chip, running Linux Mint Zena based on Ubuntu 24.04.
>
> The Broadcom BCM4355 Wi-Fi device works with kernel 7.2.11-3-t2-noble
> but fails with 7.3.0-2-t2-noble. Disabling the Intel IOMMU using
> intel_iommu=off restores Wi-Fi on 7.3.0-2.
>
> Hardware:
> - Apple MacBook Air 2018 (MacBookAir8,1)
> - Wi-Fi: Broadcom BCM4355 802.11ac Wireless LAN SoC
> - PCI ID: 14e4:43dc (subsystem 106b:0843)
> - Driver: brcmfmac
> - Interface: wlp2s0
>
> Test results:
>
> - 7.2.11-3-t2-noble, default kernel command line: Wi-Fi works.
> - 7.3.0-2-t2-noble, default kernel command line: Wi-Fi fails.
> - 7.3.0-2-t2-noble with intel_iommu=off: Wi-Fi works.
> - Reloading brcmfmac on the failing configuration does not restore Wi-Fi.
>
> On the failing 7.3.0-2 boot, the driver detects the device, loads its
> firmware and creates wlp2s0:
>
> brcmfmac 0000:02:00.0: enabling device (0000 -> 0002)
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4355c1-pcie for
> chip BCM4355/12
> brcmfmac: brcmf_c_process_txcap_blob: TxCap blob found, loading
> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4355/12 wl0: Jul  8 2023
> 17:49:51 version 9.30.503.0.32.5.87 FWID 01-e74b9cb0
> brcmfmac 0000:02:00.0 wlp2s0: renamed from wlan0
>
> However, Wi-Fi subsequently stops responding. The kernel log reports
> errors including:
>
> brcmf_msgbuf_query_dcmd: Timeout on response for query command
> brcmf_cfg80211_scan: scan error (-5)
> brcmf_run_escan: error (-5)
> brcmf_msgbuf_tx_ioctl: Failed to reserve space in commonring
> brcmf_cfg80211_get_channel: chanspec failed (-5)
>
> There is also an error creating the P2P interface:
>
> brcmf_cfg80211_add_iface: add iface p2p-dev-wlp2s0 type 10 failed: err=-52
>
> I tried reloading the driver using:
>
> sudo modprobe -r brcmfmac_wcc
> sudo modprobe -r brcmfmac
> sudo modprobe brcmfmac
>
> The driver and firmware loaded again, but Wi-Fi remained unusable.
>
> The firmware files are present under /lib/firmware/brcm/, and the
> firmware version reported by the driver is the same on the working and
> failing kernels.
>
> The brcmfmac module metadata differs between the kernels:
>
> Working kernel 7.2.11-3-t2-noble:
> srcversion: 3B6176FDB720DDE8E7C596B
>
> Failing kernel 7.3.0-2-t2-noble:
> srcversion: 3DCA38D52402541701276CF
>
> I did not find obvious PCIe AER or fatal errors in the failing boot's
> kernel log.
>
> It has been suggested testing intel_iommu=off after reloading
> brcmfmac. The driver reload did not help, but booting with
> intel_iommu=off restored Wi-Fi.
>
> This strongly suggests an interaction between Intel IOMMU handling and
> the BCM4355/brcmfmac driver in the 7.3.0-2-t2-noble kernel.
>
> I have not tested a vanilla upstream kernel, so I cannot yet confirm
> whether this reproduces outside the T2 kernel packages. Unfortunately,
> I have limited time available for further testing, so I may not be
> able to investigate additional requests promptly. I wanted to report
> the reproducible behaviour and the intel_iommu=off workaround in case
> it helps identify the regression.
>
> Could you advise on further diagnostics, or whether this should be
> investigated as an IOMMU or brcmfmac regression?
>
> Thank you.
