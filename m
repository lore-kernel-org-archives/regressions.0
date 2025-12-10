Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2018F1C69D
	for <regressions@lists.linux.dev>; Wed, 10 Dec 2025 02:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765332409; cv=none; b=FchaMLyU6S4aO6sMaxhwZFXt16nmyxOrIGu34DrsSK+7BnRc1Pa2fppLIJV/Qj7dTObMs0l1udJoxsWD2jgIv7Nh2s3F+XP2qxQTxiMmPYQjJlkERVwklT2F4IMI1OinYia29qDWL2D70r7JPzAsIHbsKxk88yXwXzYOPsnl2KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765332409; c=relaxed/simple;
	bh=dB4MkiK2v7MqEATSP66OXrd0I3cuJgQCFm92qrJ2lJ8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=p/0p79qqW98h5TF0ZGZ4CpybvIN91A83mS8U/ubURoYJgT5Ywu+13NVui2KNt5xIlLat4p7ELi3cFL8O42DNbzC4UjbGegFJelvzI8rQeScv3NmS3FVIJTCPPtuOwiuLs8fmZeMa4YHW7DOD7chnhJRf3g+FpfhYml8ydrYl4wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndPwVG6v; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndPwVG6v"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b80fed1505so6569905b3a.3
        for <regressions@lists.linux.dev>; Tue, 09 Dec 2025 18:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765332406; x=1765937206; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dB4MkiK2v7MqEATSP66OXrd0I3cuJgQCFm92qrJ2lJ8=;
        b=ndPwVG6v1SBbLuhTx4ab/qImzomd9BrlWm2YvwZ3Ku7ClTkADDoCITClJX+RC6xFMN
         3p3xF+e1mhMLyF+E/JQAxhLzrxWdBBjBpJKuThpYvxB9aU0EHobf8trlipUP/wAqVn77
         IpjXIUolkcqEu6aJfQNll6y22mG8ExuD0KoeeaiKN4ppd/MH1qkzovW2P+eMnxcZyind
         kvUdsPaPoby4+fDUYbj4SMG11qe5bs9olm2SvUvi1zwmexfKiCiSuyqZ6sZSDCU5PXEw
         I9emk34u2eVnCfQz6NZRBfcZOqO41QKuDkX7bmR9Fkhwcq7JlAhmNKi5A4+lJszChH1b
         TDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765332406; x=1765937206;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dB4MkiK2v7MqEATSP66OXrd0I3cuJgQCFm92qrJ2lJ8=;
        b=oDPDYfe0Dqmqn2qmGGjb7RP7XROIgaV9AfvJdrE5XXLT6h2WGoJ8+kLB1GtiJYZqfr
         y+5XwWG3ITNah3qykD0IyqDvn3jGbjb1Ty9WQJnWV/M+bQ0QNLzeRn7dhaJOGARUgjYV
         qrjtmco3B65jfQkwzz759k8+PPa1+X4dx1GCzwzPZYBIRaCzDPQr6vVdPo+3qbidbtpU
         OSoFLYwxMsPjI6v0Kr2CPT2O2gwU2ruL3A5Rcx42osC6ldA7yKVfpnVFGgXiB9/yv4H1
         IPY/0kmWSAcPbOhkbHFZ+dQIgX4Cd9Z1YFJevXaqiScWXfBLazlJhBpHIJootolsOnOj
         l+gg==
X-Forwarded-Encrypted: i=1; AJvYcCUNmn7Wx5YctcsvZIJSbAneUagD0c1nmkyigWM84GKCNjgp9k8d/Xe6eKKrGpibWTgUuJY16XKxs3+DGw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+fCONctI335iPewJxPhg+dlLkWC8VJthv3uW5a/xECt6vSmhj
	kWpys23PbxRuiE4uFIX6pmlmHPnmkw3k1ra3RnYRwGbxwU8oIwEi9v7h0ki22qEFeUgJs0J3wrw
	KiKD2WQ9ZzIOiLzsuYnYXugO34aOzB3U=
X-Gm-Gg: ASbGncu1gqz+LXqrQdhvf5dK/LTM93sUfupqTeBt1NWt8CKxHyD50aAtqYTkrgkGPCv
	tvcDRaxEfGsbiCuiR7YZEL7C6b9izI5s7AxNz2EliF4fzIzm1mF3c0RnFeLLW/G2NfjOLmr4URs
	Yb4nI0fCRFvJe/TucHeG6C+3LuA0QmNslmSChZImYzLKk1MZNEQsRf3DKEHPW+FnQgAvW3GpoiP
	mjRLxL0kvIs+8/Y3Ta74ifx+2b7N29bs/xxGdjjLdAKCMAKDTdpGs6HniRfh1h+NUZOiwKNo2k4
	IQiepHK9kgOuXcnDS9DCgebjgWH+z6rRgBBgWc/ehK/suexfexDRh4wdmIGQj+6lAAyt4pkUtM6
	zzPeMlKGUDI3pzgk=
X-Google-Smtp-Source: AGHT+IER/q69FCL4HOlCuiPXSy/9N7+BJvlaJ8gV4++EQVcJdhe5QlTVR4toTFk0WEj9Sp4ps54/Zo8eUBI6B3SlAAg=
X-Received: by 2002:a05:7022:412:b0:11e:3e9:3e9a with SMTP id
 a92af1059eb24-11f296f4d4dmr601926c88.50.1765332406102; Tue, 09 Dec 2025
 18:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Avraham Hollander <anhollander516@gmail.com>
Date: Tue, 9 Dec 2025 21:06:35 -0500
X-Gm-Features: AQt7F2q1xvMw5Tfz9hXQre8HX4NLZBs_1JPIE2kAknJGpjV98GmMptN_Tf5kgB4
Message-ID: <CAP1mzZSH+VPhA5_53+LxSgOZe5JHqFP_uadWTpgTxrEXBc=52Q@mail.gmail.com>
Subject: Re: Bug#1054514: linux-image-6.1.0-13-amd64: Debian VM with qxl
 graphics freezes frequently
To: carnil@debian.org
Cc: 1054514@bugs.debian.org, airlied@redhat.com, daniel@ffwll.ch, 
	dreaming.about.electric.sheep@gmail.com, dri-devel@lists.freedesktop.org, 
	kraxel@redhat.com, linux-kernel@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, maddog@mir.com, mripard@kernel.org, 
	regressions@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	timo.lindfors@iki.fi, tzimmermann@suse.de, 
	virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

This is also happening to me in Debian Trixie, with the current
6.12.57 kernel. I can also test reverting the commit in the near
future if someone else doesn't get to it first. For now I'll just use
virtio-gpu, though it is a little slower.
