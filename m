Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531E1F4273
	for <regressions@lists.linux.dev>; Tue,  7 Jan 2025 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268653; cv=none; b=Z8aWKKAQNf23Y5GblEYKTVkKScsvRcSDTfGLvTXK4EKRMdGqd+kbm6dg4kNVhg+TVJ9uCCpRkTUWmnm2O4YNfBIeBX9F0vmtS4cFYka6HJ6Y9LkqpLht0nKbUCTa7LPHcMQUtd81EHUNB8fwnHXQ7GgUU6l5BoZRVTaG76NhGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268653; c=relaxed/simple;
	bh=lMfX1ukmt9zKlMQvTs4rDaldX9Ypcnm+9H1/Ac3eikQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTS5bOO5bQA0VvvTd+WJMstfIymhT+LU1xMO8a9CGIj9wHy5mv24fhM+TXWCTEgVvLoqzxO+4I97vK+7IR2V9obEQJZ/sbwQoe6B7MpYiSIpnvI3dZQOMh7e26DVlIvCZNsCUUGWej1Lt6xWEyNjM7mByvHQL/3wI6oJ16ONZVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdJEd2vC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdJEd2vC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43623f0c574so109020875e9.2
        for <regressions@lists.linux.dev>; Tue, 07 Jan 2025 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736268650; x=1736873450; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMfX1ukmt9zKlMQvTs4rDaldX9Ypcnm+9H1/Ac3eikQ=;
        b=GdJEd2vCkXPcG84DKzEWC2qVvwJMjGtbT/wfoJB3NFWt/7nnqv+vnZxvCHKzoEFLOw
         zi1OGArSY5ADY6mFLlii5UVrkGrxcQQRMdupr9Szi7T+lKR9bS9ehqDoB3+/wzEWbBww
         XL44DCS7J7Mc3BBEKYBV2VgBh170thmUqMrjg8C8tf1m46Z3D1InOWhhCWqksTqW73o2
         wQOXC3IzExBpuDrTdf5Zv+LQ3LM9h3QBtsZ5N3Admry6C19cqgKQEI0m7reiVko4y0BF
         LtyTwURMuu/U7g7Zlpp8i+XHy24xlIJOXDIySQyByKeEQO8+3trZxU0vGs6OVl+LgetA
         umIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268650; x=1736873450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMfX1ukmt9zKlMQvTs4rDaldX9Ypcnm+9H1/Ac3eikQ=;
        b=WZpFz25hJkDa7av9Qr92FkJBZKRC0YjW2Rx0izYNrawYJR+DNuetdQTBaldi6rc0g7
         oVsd8dvVISb+FdA64aAHt8DEmAHx//pu5ZO+RS/j91EY5GYH5VCIJN86VhATMGEApmQC
         z1OkLqNtyYNJkIIVbgvK7QAhuXmydyYdI8QZNNmFpFuqGmaNJEOrFvC1t4lo/C3KiqZj
         Ud82nI/jX7bSq5LlSlJEWC5rCF/PaAVvOwdWw6lkKfgEcbYd219U7uj87VFw09LxfJ7R
         M6p39OT8liG3vFdqMTT2A0dY2y8Zfh+/l0uRK2DbrdE6bNiqx8ybgDD2gjkp6qEMh+Kl
         erfg==
X-Forwarded-Encrypted: i=1; AJvYcCUu7js8ynUpr0j7WjQ+V3SFxHXU3EAI0z9Z/8LjBqng28j+UqtNG8MUrbGz3rlBlcGdxNrCIAuKOPnFDw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0BgHlyWIWUSnYh/J2ZEi2l0ovPsrtVk0NoNE0E8HoNFJl7i0h
	GlVmMgCm+hekIUEnkT/Z4kd1wd58ZaJlEcE94bQ4e9qt+jEJTn/W
X-Gm-Gg: ASbGncuXkayrKc8a7Rb26ec9maUzOewigMN/BESjCn9rRvWMV0uSbmr0xh9wpc+hqSC
	IHVAMytxBhqVg6Epv/g/+cpp6yzcNPhh20d9aPrbhLxyGrlfPEDJmCfmIe13/9Fr4YCNbIN6Rhe
	xjprcaBuuBBERPve/LuTrt71QK/pTDbsuKsyq0IcThEXNB8V4D8DMEEdEuH9ipe1ljWiTrrXrOW
	MIpY9kB+0S8vWeld7IkyrKgc8fTuAnO+mK5m9F5N6a4u4J39ltiklJdnobutB56vg==
X-Google-Smtp-Source: AGHT+IHhld3Aj2eOg6OSq3UrWdclip0tuLg3hj6E39Paamh0zg+IMdpn2D4qS8+BRnfMsIcynzBSBg==
X-Received: by 2002:a05:6000:4012:b0:386:3272:ee68 with SMTP id ffacd0b85a97d-38a221f9fd4mr57615402f8f.28.1736268650005;
        Tue, 07 Jan 2025 08:50:50 -0800 (PST)
Received: from debian.local ([84.66.149.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e8asm50137086f8f.37.2025.01.07.08.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:50:49 -0800 (PST)
Date: Tue, 7 Jan 2025 16:50:47 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, alex.hung@amd.com,
	regressions@lists.linux.dev, tjakobi@math.uni-bielefeld.de,
	rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amd: Fix random crashes due to bad kfree
Message-ID: <Z31bZzkjySUgoOkM@debian.local>
References: <Z2yQvTyg_MWwrlj3@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2yQvTyg_MWwrlj3@debian.local>

#regzbot introduced: c6a837088bed ^
