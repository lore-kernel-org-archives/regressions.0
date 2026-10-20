Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474490;
	b=oQ9lTX3k48AhJDjlUfWx+p2JRPSVldtS+0adaTXIBPZPONJB1gpxWC49yPxv2O9iTwE/
	 lfr88lsy+Hbp/5c7uwd1BnP7DTrUGzcIbrILMj3oh6J3uuUSq+MfX4QyezTu6mQ+LQay/
	 hv8yyuP3xTGObLVXI4n7c/24+OwcvdrjXJEJ208epB8qkNfTCoY6HmG5NS+Vj2H8NHxIL
	 +jw/JCxCmOCYl0fF2iwzCu0SN7IYQ8cPtNaWJlhGZRwWYTLuh17T+7bAjfh8TUpa4dUfG
	 FfOBWAKeBacnNLqEKNGvK1T9C87ZE6CXRbOuoms9hcxd6lcjahmG0rtL5rah3rCzclQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aQfHHrXMXLY2j/M6I94/T8E0vvM8q6x0cxn+YnCDD4k=;
	b=rII3sKleJ9bAfCAOf09OpuyQm65i/KZJeALVi1Flgk1DtD348Eqdb1f80+dJKMjRxw0L
	 H1ImWlLasdvZHKCVMq0IcEaDMujirI/fPFFR4AT8qkaz7KG+hb0VFwhtnSgCHpvy4BFHV
	 Ta+QNANUOZqvt+Ip3NkjQbJHAr3eogUvnvR75q6Y4aKKMwE76ck+hgSLpncEYQWa3Uh/5
	 bhHQf81wlCmpvCIyzPDtrGnFWq+QrmIyNNhgfmW0JvVT1cKxNkGJVyxmQfgjiqrL1WR/q
	 41I+/OkVMqbcpLwkXxohi6MElkNOaAUL4nSPcDYNxwuILNxDDal7J8NMaJinEgZAIBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YuD2+0Kc;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FFF606A319
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 05:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95FFF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YuD2+0Kc
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1661210a91.1
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474490; x=1793079290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQfHHrXMXLY2j/M6I94/T8E0vvM8q6x0cxn+YnCDD4k=;
        b=YuD2+0KcI8rKG4CzKNRabKNtvJDna5WQCZQra/qIsdrgJ1bOQMBhoXFzsFbpYLncCY
         Cbgumsumy3RRcm7xdbSIVL1vDFVld9lF8lPiJFXy7OQ0O+7GbWH7/vr9akbZ2q1Yj4xv
         ModgJIAFMm3TsMvh5iXXYTl6vG5YVHf6hbnbM3zAZUczn0JAxFzLTK/k4ja9KSGfMfgk
         7w1cre5njr+aQSnfGpgtSNft7mcscBnNIuHZBUvL15I9vd5m1O1Wnzrat5BgpPEWk3va
         m36CS6CMQ6j4DSTudfXaz7M54wKTPnp6ZKp2vORhVgPP1s+AUlgNZQtqmlA4QwdfTtfq
         cpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474490; x=1793079290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQfHHrXMXLY2j/M6I94/T8E0vvM8q6x0cxn+YnCDD4k=;
        b=rb68ESTXXhjYFXcOejp9LIA5as3VIoHdBUu7pNLOgO3DyfZf+nNRBuIlQOBw/yEE36
         lJvAokbwLv7uLIedmbYwI/z2KGv/JQhz7YFUcUXG16OEttqlO9tNxLcJoYYsgZsYjEW0
         d/Fq1qmfAjE8cFRIV86NAktKa6sB6zo93YlsctwlCeJYYS3qIz/VZdYO0KJcAXA2nl3N
         JycSSs53vGAuX3D/yIVTD+i6deMw0FOCWOHHkEWpdMul4g46t06ZcbmDxqrQL1OvEIlP
         lQrGqECOu47R35N1NjE9RE/rH7dl8l45adDQh0MemCeY0ZdWqMOLJMkeOOWLLfcGWSUc
         J0mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkcrHU0PzwlxSc46k490YR4ugWq4YbUYQN7sCtpgrEq/Z3J4Wb/1C8hkrfyafykL3nZnm4E1R+pXP62g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLusOtL2lEa/P7JdmrkAR1A66n4M+uCAwS2Om691Annj3Dxudxh
	BNxIxd75uqJTsEuCvwA7fQQ9qnh2N7ZmKp5qGhDDAuKDSjYJjLUSZktU
X-Gm-Gg: AYBFou0jjTaz1Bahn8k3hzAxw0Y54ny4zk3UHnSWviGwHtV55OxxM8qVddtqTWqiCoc
	WhzhiaFSdJ0JKAFbSpgBD9b7WT9E7iUX6Wd8sGg5HiPNOkEpkTDITVrTPEL+IeRQraCJwn+WY5h
	nABJOcYGV/8wgNiD5Fe+yT3aIZs9eUzQ62jPpKN+N0g0EbgZxIxpordvU2tUOevnIRgED5IqREw
	+T2xhkjDNPU0guTB26ETKSwrFXpWjoLHEbF10fOT9eADVn5oDpplezJH6yoO4iOZiNoAr6eTLI/
	kkyWMLd5jdzw/NHfa1l4y/5e2lf+szok+g+lGVHvGDU7n0VcsWPNgbO1Ov78WviYzXWYwaKBRV8
	eeLcWTL6DXOt2XxbHKuOEVKRYTjXmvYBE1KPEoB5USGFfrkIhPONhmr6i1CNOg6F898Ynk6ZP0S
	iG3CNbg01C/ZMnDpyy4fZ6187zJIxcOYdtU/IHDFg7/CndPtGRBHUI3NIWQWLOlHO5DQ==
X-Received: by 2002:a17:90b:582f:b0:3aa:f4af:1e0b with SMTP id 98e67ed59e1d1-3acee98d90emr8576204a91.8.1792474489983;
        Mon, 19 Oct 2026 22:34:49 -0700 (PDT)
Received: from hachimi ([101.5.175.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60102ebdsm2216041a91.1.2026.10.19.22.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:34:49 -0700 (PDT)
From: Lanfeng Wei <xlfylawarthur@gmail.com>
To: tzimmermann@suse.de
Cc: airlied@gmail.com,
	decui@microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longli@microsoft.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	regressions@lists.linux.dev,
	simona@ffwll.ch,
	ssengar@linux.microsoft.com,
	stable@vger.kernel.org,
	xlfylawarthur@gmail.com
Subject: Re: [PATCH] drm/hyperv: add a parameter to disable the vblank timer
Date: Tue, 20 Oct 2026 13:34:09 +0800
Message-ID: <20261020053433.9419-1-xlfylawarthur@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8e91baa4-1ca5-43b8-bb04-9b5e3630bc2b@suse.de>
References: <8e91baa4-1ca5-43b8-bb04-9b5e3630bc2b@suse.de>
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

On Mon, 19 Oct 2026 18:03:55 +0200, Thomas Zimmermann wrote:
> The problem is that module parameters are impossible to remove in 
> practice. Once in place, someone always depends on it. They also 
> increase the number of states to test.  Avoiding them is usually a good 
> idea. Especially as workarounds for bug or regressions.

Understood. Since Hamza is working on an implementation of cursor plane,
I think this patch can be dropped for now.
