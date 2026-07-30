Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648EB441612
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425600; cv=none; b=tu6j92ZLXfLedKWKgQNq8BNjR2s3YKnX1MCZDaB17kxp3H05vmikOS0cc9VpGxYKlrJJKWv3fFuLlgSb9UQ0f9swo4VrUblmKOCyW/IydXIHL+P+5oRdG+AIkm1rx/u1MdGMBjRUW+0RlZjOptFXM8P2kgOsyEesajehEPgmXoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425600; c=relaxed/simple;
	bh=vjUxU6DfeHaH3nfWdpw7t9BZ5QMeNWrLnziCSKK+a7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dlk10PTuT2bvSxDs7gUafubER+go0AkYgrOrZrlIh5oqJQwQF+TbIPoO2i7h9HotXaed7AULlC85oXhdu9TRTGStAHhp9osGyI/kbzqwWkjbRmWcCiwsKMf6ERhc4yFjHk4hY+M5O0NrkgPVnfZjXnOiTR7JrXc42UsQgZ5aTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfS94HLt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfS94HLt"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1499588f8f.1
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 08:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785425598; x=1786030398; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvcYl98Dj1v5Xl2yAUS1oK+AUzC0Thd0BmMktXzpQkc=;
        b=qfS94HLtGREnkyAWXOo0a2JEEntz5NeWSdyWYyNLNjWpYxt3rR4QM60Wt97OeJ5x2x
         /2RRJ8Zxzvb2EGx2uHOWV9OVeF2hbsNzrUcE8sLx0FLVqEYYcm+/LbG/2S8h1fcVOoGa
         5VNkPfoNkZGKFx3Vbw+2oZMV25tYck1+EyUlJQtp+A6xdocGd4MLASuAWB69URVKoxDe
         DP/60IlZgEjly8ZW2bSIm+fi/79Fzhv+AhJZIY1McXbN2wlTr1VpnM/Qq65hfQ3r7FTe
         uW9UjtBUx5Pbj89mAvWVlcCZy2uWtT6G0R3csiMdVGRGRHx9tPN6LL0H5h0gjr3+jWDp
         pUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425598; x=1786030398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvcYl98Dj1v5Xl2yAUS1oK+AUzC0Thd0BmMktXzpQkc=;
        b=QRbfQdZRP+JJaPDlI7nlUaFvw9IMYOP3xR+8xE+0HAtU8fLtzmFWnVBOAEjPcO9Wu1
         As39VGgBuIpJZ2Sql0OA3uaaCH82UW6FJPGK9UBWG47rinZgRt3+/vqe1+Fw2Vo0/wUN
         Q/IRpqQqHfxnj33LOmVIVo7xOFr53THVmane0zFbRz1O8+nDz/0l9uzaMxKEtehnuZAi
         rGL8ZGf1Jv4/v2WsTpMm3/td//on8FmYr3R6xI5lgHxTEKm8uareuHn4GI9OHFOQYbzt
         eJREKxeZGFQvaZUA6akgUmQnVcxohpzzvzrnZxG9hN3trH1mt1OGXINoWrMyEKScxZpQ
         EL3A==
X-Forwarded-Encrypted: i=1; AHgh+Rqwov9MAjIXVYDRhG4i4QXhrpDj7cEs2t8u7hpkwbGgWdQumRwGesZ3SUL1pCIM6qmYIwrx9uMxH1zCqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAF7x79B75aIVeqE46y7q8yizePFXFhWcuWAM7ftcD/xUw8276
	c/Q2+ofgTZtcbyhrQr0h49jmlhOO1p+vlXiXRsQjChaPNQ7/4y99MNPO
X-Gm-Gg: AR+sD13WJZlhsi/Qt1Tbxto1OK99KTUo0kV2qE2EVwPtiPI7vzVDyw0cWZEHz9cynUa
	vEdWSFFH78JfTO9al0gjEonVRAJI0lCxwvLZYTSezHAKhjVGMaUeL4jH//IC4xXrwE+zXyeLKn6
	QSkvTNjGR4gmAX9w6moPRdAdABHwlH0/Yc83eLphepigAUppFWzycmtFS7WDtVcbth+Wf9sPUk7
	IdprJOBWesm1rbdg1EhuMHj3wmkRYgUY5N4QBhGCz+6EFu6qxhpkpbr05MVdkESb3Z7hcLJEBtr
	yWBLA0163djcurBLcWBGcEfA/iP6hTxTG/PRnKYZU2ThphNF7jlc8Y1H4KlyS2/C4GZgUox2aZi
	FaQaHnqobIvkI8WD2TMtCpOi6IDCy02NfP/2DPVKmNGwEcS2EQUczmziDK8oKLZYd+oLCQYOfio
	38ioBfgFf+gGv8VGZXq/KCcWnLpGkUHxZJKvgP2YVJHKeAMHguHsznPIKrkg==
X-Received: by 2002:a05:600c:848e:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-49800e7014amr40612605e9.2.1785425597583;
        Thu, 30 Jul 2026 08:33:17 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d8d37sm6622003f8f.8.2026.07.30.08.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:33:17 -0700 (PDT)
Message-ID: <692c652e-2be5-4fdb-b0f2-4d63bc72253b@gmail.com>
Date: Thu, 30 Jul 2026 23:33:11 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <2026073005-rarity-devouring-721a@gregkh>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <2026073005-rarity-devouring-721a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-30 22:06:28, Greg KH wrote:
> Does that option work around the issue?

Yes. USB device works after adding that parameter to kernel 7.1.5
> And that's a very old commit, odd that this just shows up now?
It's a headless server. The USB ports are rarely used;
thus it takes a long time for me to notice.

Other people encountered this issue:
https://discussion.fedoraproject.org/t/usb-2-0-ports-dont-work-in-fedora-43-kde-plasma/188113
https://darkranger.no-ip.org/content/rhel-9-usb-%E5%A4%B1%E6%95%88%E5%95%8F%E9%A1%8C

However, their methods do not work for me. 
Toggling "Legacy USB Support" does not help,
and there is no "EHCI Handoff" option in the BIOS settings
