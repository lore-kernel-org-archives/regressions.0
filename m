Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D2241691
	for <regressions@lists.linux.dev>; Tue,  7 Oct 2025 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759871838; cv=none; b=MIF8cDDu2pgUfHQ6HftUTE+D7FLc3lLcOCRV9Bc/bcow+1YeXVslkzxLfQrjMcvTP+tC7l1VsuiCWsDqQUeAhk0dqMtVCFGvRZ5pseewgLKPzpRHRz8R+wVRw9ZFcoiR+P9aBufjPYbrfJpKWa4FC/NXlzuKBbXdPYIxyQwALec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759871838; c=relaxed/simple;
	bh=6OEC8K8vBkTxj/pwmLqJTDbV2xpO8P+Eh4ng1eLGKV4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXyb/XbDHSzU2b0hZjx3XJxEDuV4sVeyLcZivyrY+xMZahccCn1ZcRIQO5FN8tOJMnMRcpHrxLHXa6vIogMWNyQn6ENn5L+ytuIdhIbBNrSoniPGEJpstleixnikqh1zMJNuNGkX1sbXDnM61nyxaGyrhX1WOLmGI41wSc8z3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=la9wClc0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="la9wClc0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57e03279bfeso374501e87.0
        for <regressions@lists.linux.dev>; Tue, 07 Oct 2025 14:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759871835; x=1760476635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXvgk3EFH4zPgHJiqeQ5/xOhjI3xnjXcjT4Fjjb1NDA=;
        b=la9wClc0Vq/WKW7pkhfFKJjRLuqkAmbkbty6yYDAvXHglBEEcOVW3ZkrUIzN1D3Riv
         IfpNnahKvwAo4QBSo4IgQyWztPVxlJzdUWOoBXORsgK4YLBP+B4jSWnkftkE3pm9Pxu/
         z3asitDlWxvoLbUopquIraNyUxLwNzKe5i/0MjpcmX82LlRJjoi1zhKkoWGdmXk/ygv+
         YxbB6R4qx9VjZ9cI0JftRIpjX3t8o6izo4bLQDwJGhNsZQKfILH9jVdM8ShdTXemgMDY
         n5VyRUoe3Rq/2wxUn8iNWZERR2ms+MLBzFhvsKpqJa9JzDOVr7rJhRwDnnvkkoDq9Q5W
         493Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759871835; x=1760476635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXvgk3EFH4zPgHJiqeQ5/xOhjI3xnjXcjT4Fjjb1NDA=;
        b=pnfL7KPRm9Qq8U7Xv+W8kTKqQuDVw5Kd+SEW6HMmuYjqXVGn4tBxjcDN6M0NtHxuO2
         bQ55PU7Alh8/6hsBGhnfaSHZWG0ecnX2qZx3tByBGamIw+0dcefmkKhzgru/KIZIYoAH
         jFB83dYMcoBnwPZyINPdUrKlzcTsHATskLepuT7Owrj4pT/Z1l5qryE/jpOHR5P4AyRH
         Q39V1BJaDpyxb+nolwOmoSMKdh56BQnLXVJ3mTU6/o9PGhz98+9ivwPYbHi6G8AUOSaQ
         VqKBFhv9l1VlgaJc3FMg581tvcJNG9I/ye65WZ+XjyLo5NI86xboeyfpJe85DPiur7+j
         0k0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfWDDylKVzljoPj+8OeceQTt47lu8HJvytGcV+BauPKzqmWccPrRCEp+PpFSFyqqNTz1GSX6xhW31U8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxH4faxz9aUA/Nsb+PW3pKyy5XQmQMqfXx/HHeun5Ku027zD7HY
	I9gP+ZKxSPtz8fU/N527f0FUxGmW98uF61xs08fhJTuuFDQOt+Z0qF/O
X-Gm-Gg: ASbGnctm0iTugPwIfReO6bD4BYcXUREN4QQZRJ/vG3VF/CUhMYGVEG+cnyBiZo3I0Ia
	vg3E4gs+cHbu+/MGBCp4EGCWQtfCd8XHE7Nm0GzcwG3u5fxeQIyHHhJLeJyh++FdpefCBDG8HD5
	Cx9loVeBeOVdHZSruqOcLBmD8qkXCo1N+C+kQRCO14IvuwhsW25IE3vBshqhOv8Ss+n9108L8gR
	rIPr4548xIc4SCjfXl3MY5ZSDkySb7unvlvPjZlG+RS5FcR8vu6qPiVvZsdLYCSWU2tc8akqpcS
	YfB7TyODFvDkgxcaPws2fpD5AthFUYejMjkIT4B/rHeshtUtRXtyoK3xEOtvG/mNK+p5wL3CGfl
	66iaJzNUS6iD4sFB0zmUXfqYefBrLNS9bV0Pvv4XAOyPmp1/4nI3lZ1imavI=
X-Google-Smtp-Source: AGHT+IHSfZ92DSurpArjWelyOt0hggrL5iPZMbzEXpm7qYOD9uzNCC28p/y2m9dAuAtVHmhwLnJvKw==
X-Received: by 2002:a05:6512:4028:b0:583:9860:1414 with SMTP id 2adb3069b0e04-5906f2d0108mr218824e87.1.1759871834692;
        Tue, 07 Oct 2025 14:17:14 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113fdc0sm6462580e87.54.2025.10.07.14.17.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 07 Oct 2025 14:17:13 -0700 (PDT)
Date: Tue, 7 Oct 2025 23:17:09 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB
 merge
Message-ID: <20251007231709.6c16802e.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Oct 2025 22:47:52 +0200, Arisa Snowbell wrote:
> Hello,
> 
> this is my first time here, so I hope I am doing everything correctly,
> if not - help would be appreciated.
> 
> I found regression in the linux-mainline aka linuses branch, more
> specifically in the recent USB merge (commit
> c6006b8ca14dcc604567be99fc4863e6e11ab6e3).
> 
> All my USB-C client -> USB-A host aka computer(probably all USB-A
> devices but I don't have more to test) - devices are not detected when
> I boot with this patch, I have to replug the device for it to even
> show up in dmesg logs.
> One device is mice and another one is audio DAC that also shows up as
> hub in the dmesg normally.
> 
> I reverted the USB merge and everything is fine again.

Hi,

Can you bisect the merged USB development branch?

It looks like 8f5ae30d69d7 (v6.17-rc1) is likely good
and e40b984b6c4c is the merged commit, should be bad.

Regards,
Michal
