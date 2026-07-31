Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A1735F61E
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785503184; cv=none; b=BcoSNQFTSCRAUz1dyOe+V7y90DCskvzSQrg9U1YyxMckQAh9DcA/MxlrKs4y0oyMFHdnf8730e8xcWMzIrJoaGDB+/cvC4LaMxMsWjIMmGfCSIHGZ9dZ9+m/eNm2lYZTlLrPxFXpeZkzSoWvzMrqzwJrDV516Zl6poO4R2zNVSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785503184; c=relaxed/simple;
	bh=/72SslYpy2PVQIMAAmadnePuVCvoy+6MWfdj9ZYOdZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bp11whkakNiHYDzUexVmG03Ow976EzA8jLolfDzABT+6HZ7udJSXfbnM0ilKWgbFUCmy6r4rgXcRqSz71eIdsg8JoIPLNQOgcvU0lE40WoH5744aBIXw4ghxr0d8Qic89pz/1zeO+udjAa245hBa4om/Xu/SOPsW35F7PfoiYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpBd+KFs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpBd+KFs"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caed617615so11274985ad.3
        for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785503183; x=1786107983; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWMr5EOxuzjVi5gwglHccB0LsO3CP+DoymMW6cwNef0=;
        b=DpBd+KFs9rdsSu6EVZookRF8GOD2Tm+kGTFuZuoVxF/DWJhr057biXU++nvoXppblQ
         obtBrf3B3xJz4CieuitvZVzG9N2LA3wQGmAwIZnnlkiW9sh7aJ9dvYLmaYhrUFXsVy/N
         dFbUtQ7hc0/UVa577uCvpWaacfEVqAzSzJdSbccSAZ9fvclfsTf7MyDQDHPGVUZA/rF8
         v03yE66NHbu1EGu0q4LCpORFtLHJXTLCMak5fSrBS1WC8aYg12PLLhIeZUxpMgpX9hOd
         u4A8xGppp9Kb8drsgpo7Z0jaX7zMCzOrnL5SlvjCj//Robbh1aA7pktPW7U7F5PvxgLG
         suSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785503183; x=1786107983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWMr5EOxuzjVi5gwglHccB0LsO3CP+DoymMW6cwNef0=;
        b=MOiEQcJnyp6cvE/TkFX1Z2RzfgJI//QeW38y9yfPGoJbrRHSERTjYmjS7G8v8aHCI/
         5h/eGc2UHQ2HEa7RSEyAOUo1Dy2CwgF/CRE7zdnsORZcX7kmz5By88YB+wTnXNMwWwme
         z6rIGfb8kgP2K6EgsYh+x8J2nLAnKU+WtqpbvxmuWryNDZbsZ5sFHUkxHyrEOZqFfZEh
         qOLESpXuwBKfiyRrULcpZ6UvFZZmO5YwJAhEbA/FmeKrlk5ADc9pvpKClTmBwKbFjXsg
         vXLx7vfeo8LqtS2jJEnAb8ul6di8ZBlYlJqa7+edIzK9c6H+6AA4KRAKqUKqNim94jjQ
         xOPA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9i4ZWjIEkir9rWVRY06xfyDjtutS8qt98yccFoc5qyBECEtNrwXTYQYbJVG0SMfWztPjHmXjRqdDDGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYDl6DvMioNnSOq7LEd8KYbtgZTTJj6COGSM8+Le5G2D4F3fOF
	QydQxFWibH+2lE8x2162kn7S3hYRW+JNo1jRsyKaLXdjK9WtnRA7Yh8Y
X-Gm-Gg: AR+sD103JS0kanl2erTAdN0kwmjlIpX5kI1hAD+YLWEoPVDLvZSuvCtgcyGEACXtjpl
	r7+zv64r20TyZZEUCDkxckEGloiyMEA7H3OOMRgefjKaBal5WnSdpJCUvIlZiM2x7Vb3fcCr3QN
	PrRHPJRHj5M6mjxUq63fMkBF//eUuSZEx3LWH4zRo/KvWTlCkq2gD8HikVtqe06LHbjwvpq/n8D
	HO9rjJfmF2NKRhtjJ4jqxaz/c20L5eu0oKPmZBA5cEBVaX+Ua2hzwqtid76eI8yyLqzBQEI8IzN
	1JyhOr6jQ8hvD57tW05eYJ1qX63g5+Hd7gb5x5/o3Nvrba3lh8Rg80w3A4SJSEPb6X/mhsTXZYt
	EXxv90R6mA1AKOsXv57h0U/uhggY5/QqEw5qK0vdkgimOEOozzG/Cc5MjvRvxefMUJd7+GawP8O
	dUY6sl0xa4SzDoSLL96CI0k/Zqjxm+zrHfd+K6j22s/JYhGVP+VeLeUOGk7w==
X-Received: by 2002:a17:903:190:b0:2ca:ecf6:9104 with SMTP id d9443c01a7336-2d046d81079mr19211725ad.4.1785503182834;
        Fri, 31 Jul 2026 06:06:22 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb491sm5193715ad.42.2026.07.31.06.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 06:06:22 -0700 (PDT)
Message-ID: <588c2e18-e6fb-4fc1-95d5-7a5dd0f556fe@gmail.com>
Date: Fri, 31 Jul 2026 21:06:17 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
 <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
 <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
 <7792f017-42b0-4a09-9941-5259138e21b1@gmail.com>
 <CAJZ5v0jCFFNuG7WtCE2CG+hP=YNsYMdXH_945QgkgAUcr4Lryg@mail.gmail.com>
 <37daa35f-06aa-49d0-bf0a-1b5ac9f44c89@gmail.com>
 <CAJZ5v0jyy0+hqU3=gmBrgMzLBVhdUQwDj8d0_jGCqZwqyWT=_g@mail.gmail.com>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0jyy0+hqU3=gmBrgMzLBVhdUQwDj8d0_jGCqZwqyWT=_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-31 19:58:32, Rafael J. Wysocki (Intel) wrote:
> Please boot with "intel_idle.states_off=16" in the kernel command line
> and see if the problem is still there.  If this doesn't help, please
> also try "intel_idle.states_off=24".

"intel_idle.states_off=16" does not help.  "intel_idle.states_off=24" works.
Note that the test is performed on vanilla kernel v7.2-rc5(without the patch).
