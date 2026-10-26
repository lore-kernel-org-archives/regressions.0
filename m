Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013353;
	b=Q+P5UoU8mfzr03mzUi/mTrJa6qXER+9OlvWdo+Nb4cTYH+icCGuEh/Jt/U4x9A1IqTek
	 VJkyVQoYR/cPsWTqJGQ/2boYr+2rvrz5RhzGc+GNehDVA99OjKgpR4NhI90dfA9pOzcCq
	 uwfVwpQNtLKJ+3NCT/gRF0Keyn3R951SOaKM18pm83lx2A7dXoZes1hG/qWLsHdmbL0r7
	 LUJK+SeYr3Paft30feGSkwhpiigmEST2P4dAbOupXASYO4KUgG480qPLCY7Y0Vr8PT5Ht
	 IOOFbr3BK3IQPCUDOoitgLzjb0H1JchiorjDrUGWULWdYWX1/KrS4NWhcIWXW3Kt1xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6iTiJ4gJLJtfRbm9dDiou/YdJGjg4cibrIKm6WkJa40=;
	b=EZ7cFtH0DPI2bzYTjPPfkf2qb66enZemamIiNyE745segzTqfx+2Npn4EBHbGDX2rYAp
	 bjK39N4OJdBSdzkZTD1LuhE+Ruhl3AsodCQdxhvT1YjfgCd25xnJEjEoZ8Hq6Cy0dlzxb
	 vpdzrpFnwLgVbibkhpdGkGNsopWKGXdCfzHYIQYISEv2CawyU/8iZaAo3uzFTOracPZxg
	 IPZzrnilG+TBXvhu07b1m3nfC0m5hLgyCommwg8X9aUMoRfuqtq717Uv98WvfyGe4VaHn
	 A5mHS0wntwT4rmw27iM1UUdgwY0aZ4L+o7X+fY3o1yCfH3QJzr4/znU0qGqfXRNbe+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xo6Irp0M;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8077A606A322
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 11:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8077A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xo6Irp0M
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so5289325e9.0
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013352; x=1793618152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iTiJ4gJLJtfRbm9dDiou/YdJGjg4cibrIKm6WkJa40=;
        b=Xo6Irp0MOwBbGyJaVFKzgq8IRZA5aIkA7JHbXxbQ2ilho2kMRiPRX5FqTlrbB4wWc7
         GxTUr0ctYrYsKjSeSwqi9q/R36TMvIddwi+S2NUio1O/QNeElhNCCpIAc85p+TqISBAo
         xO4AeKTaQqLkWkFOrUNz8CWqc5n2OfG7k2tu5Pd21hwKJAfr5dxRs+g8HVQ9Mbi+p1LJ
         PellrSV2oad/CYVC5RQhdvK7UuaDHlo447brfHKgiEHNQEWlZekSsLI0vPln7QFvzw71
         6MzTa7E04FmPC0WkTZmGes3hhuJridZkPTp7JnN9YFhz/z/+RbBLxfRY/ponuDQ8JI8e
         ltgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013352; x=1793618152;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iTiJ4gJLJtfRbm9dDiou/YdJGjg4cibrIKm6WkJa40=;
        b=pGq/Sr7Q4Mp88wWLUtMBRkHWo765dj6OY0lJfKUV2E4e1eWf41DmTm7qLpgAimxdKa
         nYADFQ1dzyONDBbFKYL2Az4WXYlTPkwajVoux4Zb0sspDottsbkkyJ3R/CDch+lxTelB
         kVVdMQQ5ja2s2Qho0MQrpV5LcDgJGCX0OpSS1kRWecB0ndejeu5A56B5jUl7rrqmr2bi
         QmD2MF36anvYJSxoBZLgoGcupgwrjT6QzP3aVvPvmhpuGjw4ufWOLtGlCCRnN/6EH9e/
         Ie9Xeu2G4BggvWvry6uphchfbfyn73wFNMraoD9/Nk3KTp7TUoy5ho9Vdmt8wd8Mq79N
         bjBQ==
X-Forwarded-Encrypted: i=1; AKwUvByTwPyNxj//cHDGF+xcBj0WrTkBWYURpLGNnmMfMcKm/DXyy9OBVQOdsqQrgIQCd2Y3TbqxzO3uH17Bcw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJbHFacprS9Zx1K8X5qu+bhuDLe6BwWEZiztehO2EMwvo5eFDKk
	TRPFNQM3MLia0lQlio2ajx1GBOCyNfxLJ2Z7L4/vdx0V2wAls23RolsI
X-Gm-Gg: AYBFou1XmCFXsJWhPBBB2Up57QefUCQgGCsenj2SEV9dXbzL5cimY0DmjEabAM269jD
	840MUbdhXcGCoCORV9x9oz1Nc63kXpmepTtomJc4JHokBrnp03p8xbscPeDaLP8LqYR65MJOLdE
	2Y6pycRopQdyUf9+Esg8hlZ4iilFYwnVxTL49MuWnW+WrtvbQaCl1bjpv6QDT+v6WBLa1brQE08
	+5psahX+tFx6Jw5lTN409afcjTRbaH9fbSmDGUj9wTnxcAgvQaMgqohQfkX32g4XUNyxb/fAy2p
	+RoqnSlXibiQKUhuhpyIdeYYuDBZfRe3mPLOfLh8/f6xODolxMx/o6ff9UXorUBrMR36uEkrpCF
	ObiWdUVKMfisu91O6iKjJIEn+Jz/glYEfTlDEbpjubxVDg9ULA+Gxl+5AWZcUYTBb/Cs7hW1xSW
	+aSz6VNOCyRsanGMTnh+cY8wh8rKZBt4rwlI7XU1lW5JfYPCiF7iCoFfVQLy2PcXd+PAacnSPLt
	Kx/NcH+f2bt75jvrOFMdJqRuso8BifSdIdTH3dT9GRGO5m71EmjPWEKRNXXe/es
X-Received: by 2002:a05:600c:a00c:b0:4a1:e04f:15c7 with SMTP id 5b1f17b1804b1-4a35ac881e6mr130266715e9.5.1793013351721;
        Mon, 26 Oct 2026 04:15:51 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm16306551f8f.12.2026.10.26.04.15.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 26 Oct 2026 04:15:51 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:15:44 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Dennis Wissel <dennis@dsine.de>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261026121544.41fbb71a.michal.pecio@gmail.com>
In-Reply-To: <ZxkLPfjZS8ibGyR_gfGYKg@dsine.de>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<ZxkLPfjZS8ibGyR_gfGYKg@dsine.de>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

There was some problem and I haven't got this message until I found
it in the mailing list archive today.

On Sun, 25 Oct 2026 12:11:21 +0100, Dennis Wissel wrote:
> 7.2.11-1-cachyos booted with "xhci_hcd.dyndbg=+p usbcore.dyndbg=+p
> log_buf_len=16M", mouse plugged in at boot. Below are the lines for
> port 1-1 / slot 1. The full log is 270 KB, so I can send it off-list or
> post it somewhere if needed.
> 
> This time all four interfaces failed with -71, not only 2 and 3 as
> in my earlier 7.2.11 boots, and there was no "usb 1-1: reset", only
> the disconnect/re-enumeration. The device seems to drop off the bus
> right after Set Configuration, at the first control transfer of the
> usbhid probe:

OK, but you showed a different log where the device gets reset.
That's the interesting case which causes problems with 1f36cc9fa949
and would be useful to see with debugging enabled.

I wonder if it's possible that usbhid driver requests a reset to
recover from errors and usbcore performs it blindly without paying
attention to connect status? Maybe enable usbhid debug as well.

BTW, it's likely that the same will happen if the mouse is plugged
during operation, so there may be no need to reboot each time. And
log would be free of unrelated boot time noise.

Regards,
Michal
