Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A3720DD4E
	for <regressions@lists.linux.dev>; Wed, 12 Feb 2025 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739372121; cv=none; b=d0SyiUT52VCOKR+Tk5rYm6aePuuprrBLiaJby7+NWoph0hui9O1rOMuWZWT744AsrpOtvrUa0GnccnpTj9PVe2+cCmZNscJULf6SZDMfmQHGZY02B/87aJjz4gddJdRN7Hck4fKZEf14C7EGxd/scPlXJOiBAfZT3nY6XtlHZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739372121; c=relaxed/simple;
	bh=IbtkV7VYdQ+EOOTcesgmqmBfGe4HNr+O1bDE8ixf3H0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jGjzd1SFOwhAYXFI9HEbpgAk8SayT6OtjsIoBTSm1lTHUWjxhcxW+ipgofAfNakm1mK+QLGPT4P5uXZo3T38aOHG4PG2sV3eGxpOQP0mjGj0KpPv4q7cL9KPFlamEXphDx2y3OEqQ8ZEMpEZ4D+Hb7L1ns6DQKUWLqRBORxAz4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fqtxt4vV; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fqtxt4vV"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2a88c7fabdeso3943026fac.1
        for <regressions@lists.linux.dev>; Wed, 12 Feb 2025 06:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739372119; x=1739976919; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MSNg6ZKNxkzJrjibxZqNXmnNpAozgQEy/8YtDWWeQ0Q=;
        b=Fqtxt4vVIyG1eyQpwWRv7LvMguov1H2qkWquFKA/KGywEc5WWvufkC1oL2ZOGIz2la
         RPmAu9YrVs+ObAATGW0r6LXAqBgJlbpceVHiEbIAad2CRjddxsl3kkTeV6MrmMZVvfap
         FlrvaWJLs8httO9oTpksakyw2PdybMfUv4pz4KyIciPs7vaZtY3N4J5bTrolrahv9tk3
         1VbTJS9qRVyZw/fKbtHT+Bom9QEIaqBhk9s4lnRqxnlZNvaDv+poHLEVgAwuXNwqsTIp
         RQQUHWfNOnCBCCQs9lsHCW/25Lpb+L8VOQ8BU1GWc1RXP2EpYcGKtHLRZMamANo498yz
         Sm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739372119; x=1739976919;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSNg6ZKNxkzJrjibxZqNXmnNpAozgQEy/8YtDWWeQ0Q=;
        b=BTEzbg5bF3hgaPpPMuOdM95LtQvYsXKoRc0Q0dUYmeu3iKfdtFNw5Ta3QjcpNTG8yy
         1kUy3+gcdKPYXZYh1vRRZiaHZOIu0IErqI99vMUO3+wlTET7Pp1v4aSCrCORRffhJSuM
         6d2VqtbiHXHs1PfwsHWGGfN45GmO0T95zsUlzplSCZlosbW8FK4pcVut0VuUp4idYZFY
         BqADAIuSpLBxmPIjhhh+7XalmJGgpiJkS+EcMt3Rv2MZBgNc6H3elw+Hlb51YDDn5uIs
         QHf1Nt2r1ndzlqNlRoLWDe+Tl6niidf4s6V6crhFj8020HZTAO5NNPsq3PGnsiVaa5VC
         nMTw==
X-Gm-Message-State: AOJu0YybeA3MqtaiRsaTY0vaxxUXmab8VePcOu8Krac1qk/hWEZuuV/e
	bZtUGTGhb7VbsXy1kDN962lcspevf6GguiPnLreGNA0qVtIOE752MV7F68qC2k7WLhSIbsphlwp
	oQNQBTsV+uKKhE2EattSoZOBdkuk=
X-Gm-Gg: ASbGnctTEAWFbUg3YUgRNHAm7vE4sq40W3OsA6x4QxbcwzDTlVQFYJMn0qa2r/3Ubh+
	oLI5FTHVAhhAdlMcdUn6Kr0dTqa+JS0uo0py+bas1Ty20uOoCcgZ1Mi1o4sdzfetGAQ9i9FSbnw
	RaLmltteKm6s+7TZ9sqaH4yiliPVy0kBQ=
X-Google-Smtp-Source: AGHT+IEG3yKnzH2nfEOb3BpqpatWdPALoI0meFuH9P4QQ3DJpeuXmmEPPcSQ25B/BU8RcOhyRkLePQ6xnYDFaP2ol0U=
X-Received: by 2002:a05:6870:3914:b0:2b3:8b27:c352 with SMTP id
 586e51a60fabf-2b8d682ff06mr2378978fac.33.1739372118789; Wed, 12 Feb 2025
 06:55:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Avram Bublil <avram.bublil@gmail.com>
Date: Wed, 12 Feb 2025 16:55:07 +0200
X-Gm-Features: AWEUYZnJy2lzPNeOGF5BFFO2WMoYTOsevQ8QMq92WEyjMbO3WFupeJlHqyrOtBM
Message-ID: <CABtvoZ1Y8u6KwoKf07X5_nJ-S-WrMVS_21tT2sezNV2u4AhLNw@mail.gmail.com>
Subject: Regression: 6.12 no longer loads the snd_hda_intel driver for Cannon
 Lake PCH cAVS [8086:a348] (rev 10) - (Realtek ALC3234)
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The card works fine on 6.6.
Here's the output of alsa-info.sh for 6.6 (where it works):
http://alsa-project.org/db/?f=ac3a0849a332189eb61a640fe94b46de369a655c

Here's the output for 6.12:
http://alsa-project.org/db/?f=22995c74392ed86393fc2c180ab7ae010e6cbfbb

Here's the output of $ lspci -k | grep -A 3 Audio
00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
    DeviceName: Onboard - Sound
    Subsystem: Dell Device 0871
    Kernel modules: snd_hda_intel, snd_soc_avs, snd_sof_pci_intel_cnl

I have initially also added modinfo for snd_hda_intel, snd_soc_avs,
and snd_sof_pci_intel_cnl - But my email was flagged as spam, so I
won't do so now.

Installed sound related packages:
sof-firmware 2024.09.2-1
alsa-ucm-conf 1.2.13-2

If there's a need for more information, please let me know.
