Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223695;
	b=CI73vHtjQymY1R0XrJ9HbNAQrNiwM4KroDB70Gl2AZhgL/O/2UDycG3qTVHss1r6GN0I
	 vNmNz+eKVz6DwzmJWcVcELPShp0hLkRF5jCxZD8FEfyv47lkHZBAU1dHZx70XHKUBne3g
	 Rf3J+HkwdsItKY1Nmkp9uPXszCqa9qt4wkrVSyDknX9fbSqCwsrZwgB/WGZXMmW37GyRZ
	 Oec5ZRZ//Hpbuli0FRlcm6WgOxLDDaTfv0O0uMXBlvThGf96EH8AxBJBlv7g+K1Bpaflr
	 o4TW7OtATb48ec15WMCkcqtrmksL/jsbxhelaORbK/FoDbl9QJf75/vDEYGY6RYei7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To;
	bh=uL6RhmKuwLbd3W7zN8nw8Ct6B3sRphhKnmHsX+nCe0I=;
	b=4b0caaISep5cge2V2MqEAGbsLC9tdIqoZxARCQAM49j9M34IuZt8yMbATl00Mshwsnqs
	 zkjIuukcGC4BtZPbEZzYtIlsa3cRXYT14oQVLZjdAoYMYssR+W2qPCoWIEQhuCs1AJ2Q3
	 83l3UwxWdKuAKViC0Jp+LlOLgcveSDxZ7mExCMnqsq7xEpoq0c/NYdBargyhLtYXDAdtc
	 1Vc7QEGRPhbeGEsFxLJzlmYWCEpdvpl+yephkEfAlnMsUldweL6ypDCepF6RoWxRm2C+O
	 KFd/BL5VU2L0XPpFq51NXKVtoimmnoD4Ykc5DNfw3lN9iAOUD71nMtBekadEvEDyMIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iW/KHHeY";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28AC606A321
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 11:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28AC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iW/KHHeY
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso328229a91.2
        for <regressions@lists.linux.dev>; Mon, 09 Nov 2026 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223693; x=1794828493; darn=lists.linux.dev;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uL6RhmKuwLbd3W7zN8nw8Ct6B3sRphhKnmHsX+nCe0I=;
        b=iW/KHHeYFlcmqcLbasuHrFFMoucqXLGD1Kh6TMtlUzmosDl/UPGP3od+sbx6PQG7pN
         EqcZaPEkJ1EYJdVVK35s5kdQfS9YP8JvqnwA9s/rje5Lld0h7nt7+ipDw4NJWdNPJd/2
         oq/lYnDBfDie4ucHsYnQBY1yn9iYyQfO62viktxIb6Mnf9UrvH2ADWAR7BmUqohnCzAE
         15aW1DVLwdmWbL3Ah0Di7Wmu1ywkNR28LM8UTretvf+4KWWvEZVPOK8RHZd9q91NmvpH
         vhO9pAcdn1oaEB8600s/NU5iL4346rfvOnQv6B6xxeRvWGw6g08UzSMM7Tpej4BWaObp
         gnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223693; x=1794828493;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uL6RhmKuwLbd3W7zN8nw8Ct6B3sRphhKnmHsX+nCe0I=;
        b=a8YXQRkYO1A9IrwlMKDsF9bWsCxKKp4BvzyCRuMMeq0b9gbpA5dZHJsIYlFPNNgBUh
         k17AV4/bTkfXF493ABrPzLYznpjCrchD9okXH5neFwCDNDJZI5GtA4MrT1XW/7BSODk4
         xXaFLh6JLWL02J32zLAaFRC/CDMYl9Dipr6cAJX+x1xJhgU0lKkiG/CDB30WOLIVV5xR
         gY4mT9ommJLV4LQnS6GMyc+dvA8N1WNfHPkXaS6T074V5cxEZ/oTE754k6NT0VCoCgwE
         cQ7U3pA9PkR34cO53I9ddV5KiBAVqkJ6tuQHSYetCwzZvdPh2fmFrTFdsJB36zV1B6pZ
         Vt3Q==
X-Forwarded-Encrypted: i=1; AL+hErGVbPSuTtXnJf+Yn8Pn8Q1XslHcyop4OEJHa0vEUDs647KsMUYVN11njQBfjJpTnyITnfJjQATCx/yUfw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+dM5VwGPHvOq72t/Uyzu/USdeZL9S53OwtKRQHCG4TUte7S9lI
	sZbiD2mLHs/bMKpKZ9g97/dfjb8YA2HCTvS/tVoO42H4K59+NbMP/AfeqtLfgw==
X-Gm-Gg: AYBFou1JxgPn8yjpwpueZb5hwlx4Iw2nZM2Y0+ifWLjjXx9Q+BO5DXdB+7dkckEQR1w
	htKctlKMPu7E7cJ3Iauj0XlwzIgL+m2XWqbvlk1IGKkiKbbbRP48gozPyepRWqVwCD1t4l6gWRB
	SV1hMb9gyFAEkMoX/ItY0x4sbrQ+JE9IZm96w1D3yZK79FFGAr0HQbwQJPI1r7rdl1a8gRcfE1y
	XlCeaQo/6EzEfoxfkfpE9WP6V08mGuCK/WVzjas7AhGCa27BzMmyc7bCoZ/Y0gaSk1Jy++MwsYT
	woMzFCqgc7Ba9fe2kfFFeRY8kFFUU5zLgTFYXutbRnU6HVqKnnH/Q6DGZYbr3QZesVm0xc37cxQ
	hMtmL54RXs87uzi0qctqY/B0mxDPAyZIdJklBKPuBaoD2HN5iGLdVf8tToMnuvyEvUq9KMUcVFA
	99Nwdru8oZy+jiREXph8WBaGTrQeBIge5faDK/f1Vz/dTcH6vRG1NW4Lnrm8vzZrolBLC377yK0
	6ceV17oMssK6KFT+vz/qlvtg1NOqyamsaH91H36ql4q/qDxcejiC+as0bZGzfN+sLVAR5W+y1tO
	pJttzR/8WqVtXTCiexpc8ZlRzP0BIiuo8j+RYw6hsat5EVNUVhlOHbmwaqb9D5CDhfYe
X-Received: by 2002:a17:90a:d60d:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3b12d3fc0a3mr3218214a91.38.1794223693512;
        Mon, 09 Nov 2026 03:28:13 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:53cf:9f18:268:d90e? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b17f8sm10509800a91.1.2026.11.09.03.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:28:12 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------eEY0seXdnSNL6YyQVbiaaKUv"
Message-ID: <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
Date: Mon, 9 Nov 2026 19:28:09 +0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: =?UTF-8?B?0J7Qu9C10LMg0KDRi9Cx0LDQu9C+0LI=?= <rybalov.oleg.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com
References: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
 <f718e7cd-24f1-428b-b9f7-28bb1a923a11@gmail.com>
 <CA+Kibh6T9tPKwhSF2X5Jwoo8OUoieypuAyM4GBKVujUDWgpr-g@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CA+Kibh6T9tPKwhSF2X5Jwoo8OUoieypuAyM4GBKVujUDWgpr-g@mail.gmail.com>

This is a multi-part message in MIME format.
--------------eEY0seXdnSNL6YyQVbiaaKUv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/26 18:43, Олег Рыбалов wrote:
> Hi,
>
> Attached is the compressed acpidump output from the TM2209 board.
> The MSDM table is stripped since it carries the Windows activation
> key; everything else is untouched.
>
> Thanks for the reply-all tip, using reply-all now.

Hi,

Here's your quirk (inside the email attachments).

Please apply it on top of my patch series in this email: 
https://lore.kernel.org/r/20261028112742.674847-1-qby140326@gmail.com

--------------eEY0seXdnSNL6YyQVbiaaKUv
Content-Type: text/x-patch; charset=UTF-8; name="TM2209-quirk.patch"
Content-Disposition: attachment; filename="TM2209-quirk.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYyBi
L2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwppbmRleCBhNDMxZDNm
ZWY3NzQuLjY0MGQ0OTJkNDZiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYv
Yml0bGFuZC1taWZzLXdtaS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQt
bWlmcy13bWkuYwpAQCAtMTEzLDcgKzExMywyNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJp
dGxhbmRfbWlmc19xdWlya3MgZGVmYXVsdF9xdWlya3MgPSB7CiAJLm51bV9wcm9maWxlX2Vu
dHJpZXMgPSBBUlJBWV9TSVpFKGRlZmF1bHRfcHJvZmlsZV9lbnRyaWVzKSwKIH07CiAKK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9wcm9maWxlX2VudHJ5IHRtMjIwOV9wcm9maWxl
X2VudHJpZXNbXSA9IHsKKwl7IFBMQVRGT1JNX1BST0ZJTEVfTE9XX1BPV0VSLCAgIDIgfSwK
Kwl7IFBMQVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQsICAgIDEgfSwKKwl7IFBMQVRGT1JNX1BS
T0ZJTEVfUEVSRk9STUFOQ0UsIDMgfSwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0
bGFuZF9taWZzX3F1aXJrcyB0bTIyMDlfcXVpcmtzID0geworCS5wcm9maWxlX2VudHJpZXMg
PSB0bTIyMDlfcHJvZmlsZV9lbnRyaWVzLAorCS5udW1fcHJvZmlsZV9lbnRyaWVzID0gQVJS
QVlfU0laRSh0bTIyMDlfcHJvZmlsZV9lbnRyaWVzKSwKK307CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZG1pX3N5c3RlbV9pZCBiaXRsYW5kX21pZnNfZG1pX3RhYmxlW10gPSB7CisJewor
CQkubWF0Y2hlcyA9IHsKKwkJCURNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIlRJ
TUkiKSwKKwkJCURNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiVE0yMjA5Iiks
CisJCX0sCisJCS5kcml2ZXJfZGF0YSA9ICh2b2lkKikmdG0yMjA5X3F1aXJrcywKKwl9LAog
CXt9CiB9OwogCg==

--------------eEY0seXdnSNL6YyQVbiaaKUv--
