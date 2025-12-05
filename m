Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F09FF507
	for <regressions@lists.linux.dev>; Fri,  5 Dec 2025 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764893698; cv=none; b=cP0+W7VcmCKYvrrQo3Rs2rranS9aZhfEUkYnFT2LXspBJlUP8LU/rJ26bJCfJHDHsdM5ZKZk0AY3ZR5PpiP3ZHVZOUN6Eup9w9tFVCHIyqZ8QdcSCIWPXuPISBvghZ0wcd+/cyQtLu1WE4rBPG9tyCnC4TBw2IJ0tUr2rahK2F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764893698; c=relaxed/simple;
	bh=/UrRN4HO9XgOUMTcFeoV3G+pb5lo2U99zzXdKWuGylk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hz6lT1QdQFF8atpvKBdA8OjAqWYlRkcFemGVniE/3AJQzlyIeSW0aGW6fYA1Do/GSax1MklW+mSo646t6cd0flwA2BHxtDqEsqU448wHCkBtrlEKDh/y5mVynjpLTRK72HWCi3hncX2Nrziwyc08MHzjXVA4jnr2j2cPNjU0Ksw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBqL/XRS; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBqL/XRS"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso3831170a12.1
        for <regressions@lists.linux.dev>; Thu, 04 Dec 2025 16:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764893695; x=1765498495; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/UrRN4HO9XgOUMTcFeoV3G+pb5lo2U99zzXdKWuGylk=;
        b=SBqL/XRS8Pj4n12VIwYsxobGyPlAf102x2pnzYiRhvLFudD1ZRqGkEfFZ9mILb172t
         vfP8qc1zt1vlgZWgJIpvd3Q0MgDl1rqu0xIh/sNqRaUVmuB+vKcYo/DMyRP8jIBoERSb
         6N19DXbYd/Mt2e7LhdYec8zYGUIl7dxLriGGaD2/thLDOgCaK1NRLDXGpAp8zQjUqZAr
         l4Z4oUk5h88a8x4ge/VoQM4kBd6XtW92yBM8NjlY9ONZzijdlTWZhpLryY52Oaa0R7N8
         pMbx1rc7QLGsuqUSwoK7n585yua4nRTONXYfU8QHGxwBFC/y62Vvk0nNxwu9dXvSC+XS
         o58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764893695; x=1765498495;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UrRN4HO9XgOUMTcFeoV3G+pb5lo2U99zzXdKWuGylk=;
        b=XGIdL8RmhAdhR5i0JeSbtwsIcev++XZ06yXoAeyiXMSYYtKbLRTOQwQ24TkoeA8Cjv
         Tno69ZfjZj0RSH3IIZohlklqpnN7E7+Z4uWWV4gsZCfTe4l7AxN7TlzVdY/Gyl2ZKrnf
         F4hKl0D34xxpUbbopZs0qPKlkP8dGjCiECfpKS2LlukSPSuXqqMOSjYnrAEVbiLrtQt8
         VQVx2pQfSTS+nwjtYHyt/zwlaWCkqchvPruaG5y+TOYO1K4mK34XsZq/owtRFM5ILRgu
         EQsihGNoyeux5yd8rMtCFMBFxW1WToWBcVYWt7BNrQGfsjs+0tWazSfL9Q/pEi/HEHgE
         rowg==
X-Gm-Message-State: AOJu0YzoqeZ+mnxnx/hgLarqKdtJEDSfizOQASBgNo+N2M/U73OgCpAK
	iJFh8W2dc/+x10mWOwYK0xscc5fmAFVLownmHFt3CN/EJM0TPU/nUIQ8QRuwSA==
X-Gm-Gg: ASbGncuvY9GHyf5/ajP0nhMnrqBPj3y10bh8QRo9yGGsb+0K3aEL+NPWHOJiwdF4/sK
	BZWUt6j03wTmtXci82qrSSNZPVdhCF7ac45ILU10pGZGHXwzJUzOBhYGBgLifONzgO7LUFZkkRc
	N6Vc892VUXex7jo+sZLH2gjO769C/mi/CCdmyRREh4xW/1AIAuWhv7wK+URrb8zYlVg7rUrjtte
	4c/bnvDY/fl6S2fGEz/qhBOihIh6KV51jGhEO9VKsvml8qsvR7k0vRXrJtcn08V9I/VWoQhwcWR
	vOcQeZ0Xmj2lVR8GtN9Rn+7sbnU1Ic0GwIsK4ynC38ePtk9XAFff0ESfj9tCyRYnd8ZJSo1K15G
	SnuP6MvMKCvk1ym5Gh86fI1Mcc6vLH5VAZm5BLYKuPLuuzuud7kwvy7GnjpqwvULaKWeNv6bbzy
	ZDrdjUoCG1uZEDmAI=
X-Google-Smtp-Source: AGHT+IHj9em9ne4kICq3zfVdPwx9DUEUAKp83f8stsgM5UrFVKk/t9aNTyh73sipWq0znYZpGt4RFg==
X-Received: by 2002:a05:6402:1a43:b0:640:aae6:adc5 with SMTP id 4fb4d7f45d1cf-647a69f6860mr3289481a12.4.1764893694708;
        Thu, 04 Dec 2025 16:14:54 -0800 (PST)
Received: from [192.168.0.102] ([178.217.208.6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b4121f07sm2341224a12.28.2025.12.04.16.14.53
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 16:14:54 -0800 (PST)
Message-ID: <4f1edd4c-9c74-4f04-a856-81d71401865b@gmail.com>
Date: Fri, 5 Dec 2025 02:17:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: regressions@lists.linux.dev
From: Full Name <overtube1@gmail.com>
Subject: Found mistake in kernel documentation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

https://dri.freedesktop.org/docs/drm/_sources/admin-guide/index.rst.txt

line 26:69 "tem" - "h - letter"

