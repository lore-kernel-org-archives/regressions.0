Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5396EDF46
	for <regressions@lists.linux.dev>; Fri, 17 Nov 2023 15:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJPdPbLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700233291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZvKlexA4qE1IZw8Fj3LwrdUD9v+b3hIBxm3Oq8CuLk=;
	b=VJPdPbLKJvkGT/XXBalxcyVHXX/g1pXSPgRDfsPfllbFnW2WmKXe7H+9W0yUNhxK505B9I
	uiWLE/nAYXdjBKP+ovI+G+KYcbafLfP1QWVKUlq890S0xj7XsPDYAoHwuPWEPrbQFj2uCm
	0Tg4t/SBSwZ94WUv2+IDQDRKPfEBZCw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-Ip1155YJP2WJW5vUSAc6mg-1; Fri, 17 Nov 2023 10:01:29 -0500
X-MC-Unique: Ip1155YJP2WJW5vUSAc6mg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9e644d94d84so148171266b.1
        for <regressions@lists.linux.dev>; Fri, 17 Nov 2023 07:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700233288; x=1700838088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZvKlexA4qE1IZw8Fj3LwrdUD9v+b3hIBxm3Oq8CuLk=;
        b=X8DyJarD4gIqiCERnNntGLj753/7DEJe3z6QBtYAAr4H5k6L2Y8SUiV4OLzZ+1foFw
         O4iQJ6WBHLV52LoXh7AafewdzznluGM08z0gwJEgrkDJmUZBtqyaBeU5IfKD3K+6It2T
         vhGr2NxHFz/B+543KJcg+6OffKp2pz2HOQse1GkExiSiv8HozT4vHqRNKYHend0gPk1T
         KFH0+9NOOoQzkOqOPejYft+JuX3CEokWxIKJp9yN1HGJkKs9tClaq3SP3pn0sVnMiBQx
         ooKwjSMyu2rM2iuK8iMklO1jpCFA3c241MjJsheRqbV6yNm4Y21FDrlWbjdT+o/15HUd
         F91A==
X-Gm-Message-State: AOJu0YyErnsi7Yz8l3ATRYVjCt7QiIxybgrSyHspD0Zr2Vs4Iu3Xo3zc
	AXukp1Q9NyC8OOQ+RcaXOWvceB0NfxFOu1LdWCmn8HJL7XqOOH9MDgTkDr5wL/33WMor4vXUldx
	pU4JMRvkLWYW9bRbfiOfbb0w=
X-Received: by 2002:a17:907:94d4:b0:9d3:8d1e:ce8 with SMTP id dn20-20020a17090794d400b009d38d1e0ce8mr18085269ejc.20.1700233288193;
        Fri, 17 Nov 2023 07:01:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6V2pxM69SBsfb3ukO60+ra463B4IR7Z5LGGH8zA6n04xG7X1Arr+vrPlI13/oI2eMpU1Cfw==
X-Received: by 2002:a17:907:94d4:b0:9d3:8d1e:ce8 with SMTP id dn20-20020a17090794d400b009d38d1e0ce8mr18085234ejc.20.1700233287836;
        Fri, 17 Nov 2023 07:01:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lz10-20020a170906fb0a00b009737b8d47b6sm855577ejb.203.2023.11.17.07.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 07:01:27 -0800 (PST)
Message-ID: <88a14de8-ceaf-4c1d-ba6c-6cfbbffa0e2a@redhat.com>
Date: Fri, 17 Nov 2023 16:01:26 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Found a bug with my gaming gear
To: =?UTF-8?Q?Andr=C3=A9_Kunz?= <donatusmusic@gmx.de>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev
References: <bd1a6eb1-a8af-4181-b9e4-c7b8d3af1eea@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bd1a6eb1-a8af-4181-b9e4-c7b8d3af1eea@gmx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi André,

On 11/16/23 23:41, André Kunz wrote:
> Hey there guys,
> 
> This is my first kernel "bug" report ever, so please bear with me if I
> didn't catch the precise right way to report this.
> 
> The bug I've found:
> 
> I'm running stable kernel 6.6.1-1 and as soon as I install it, many of
> my mouse's hardware buttons stop working. I have a Logitech G502 X Plus
> (it's a wireless mouse). As soon as I install 6.6.1 the mouse's hardware
> buttons won't work, i.e. only the two side-buttons would work, not the
> buttons (and/or my created profiles/macros) would. I have a few macros
> assigned to some buttons, which work perfectly fine under 6.5.11 (and
> earlier), but as soon as I'm on 6.6 they'd stop working.
> 
> Just wanted to report this and I hope there can be a fix.
> 
> I hope this email was not too much out of the ordinary.

For starters lets collect some logs and see if that explains
anything.

Can you do the following:

1. Boot the working 6.5.11, wiggle the mouse (so that it connects)
and the run:

dmesg > dmesg-6.5.11.txt

2. Boot the non working 6.6.1, wiggle the mouse and run:

dmesg > dmesg-6.6.1.txt

And then attach both generated dmesg-...txt files to your next email ?

Regards,

Hans



