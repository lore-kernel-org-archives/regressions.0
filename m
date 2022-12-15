Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F528E3
	for <regressions@lists.linux.dev>; Thu, 15 Dec 2022 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671102834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UHHz9Kno34PT7nxu4+JC0K7w7DkJwInsEXdhMcjC+w=;
	b=YI3gpC79V371bU7KmqMjECiEQP6SV82x7R6vZPyUIocQx09LRyg4bEz8w30wgcjXKWMyKD
	FJVANY/jOY1B2fbIpmOhT8LLfN1reB8prV/iwRlzahFMxYJjJ1Z7U69cDEeJfFOnaybh7E
	nQfEiMGwei2zDK7FCTpGSo5ED89DQkU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-JtfpjQ4EOV6Xz-JnEoz8HQ-1; Thu, 15 Dec 2022 06:13:53 -0500
X-MC-Unique: JtfpjQ4EOV6Xz-JnEoz8HQ-1
Received: by mail-ej1-f69.google.com with SMTP id ne1-20020a1709077b8100b007c198bb8c0eso4474968ejc.8
        for <regressions@lists.linux.dev>; Thu, 15 Dec 2022 03:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UHHz9Kno34PT7nxu4+JC0K7w7DkJwInsEXdhMcjC+w=;
        b=ubEhhKcpaEhfu+5mL0le9nC3VEmCT1rkziX9zSYlojzrrVDm0fLxUVZcptOVbgqYUO
         gLqCm0vvJcWCg2XIFdQJyEzo7Vjne2GpweXTI0tYwxgXjk+OukZjfaG9w5eFTYf8vE0i
         rako2J4qmKEl0R9zASesL9o22OEypPmISUxGmN8rx69+lnzXLX1lCU4gBGNGpip/YkXz
         /LOEwBsYnSGB6u3dutfjsJ/FX90utJczJWyhXninSATlc7icuJx+qVveYxWzhGu4ajnS
         Y8pmISiiyvJdjheKRlffYRGUwct2E4vUvvf86GSOO5DL4iFj/KUUCasm7E6HiJsfDLok
         tfrQ==
X-Gm-Message-State: ANoB5pkDaBU+upNtekcP8JQwf6F40HWFxHRaEDKZ6/JSbO4js1I1lbxi
	DASfngUPNBzorp1JWDAEs8pXvBmoUAu80IXXIlGNle/v6dvXsgiYuVFcpiVRJl/q+09MssByEc8
	jUmWOxcamBKJY6bB1y8q44BE=
X-Received: by 2002:a05:6402:3224:b0:46c:d2a3:76b3 with SMTP id g36-20020a056402322400b0046cd2a376b3mr28977475eda.14.1671102832281;
        Thu, 15 Dec 2022 03:13:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5FJRMxWcGlMlvaOTHOwNu+btQ3x5Scc4xaXNnvjgOMNCbQfuNs6QNkwt3RW0iF+83QX3LMvA==
X-Received: by 2002:a05:6402:3224:b0:46c:d2a3:76b3 with SMTP id g36-20020a056402322400b0046cd2a376b3mr28977467eda.14.1671102832099;
        Thu, 15 Dec 2022 03:13:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id h25-20020aa7c619000000b00467c3cbab6fsm7391602edq.77.2022.12.15.03.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 03:13:51 -0800 (PST)
Message-ID: <5b1b6d7a-ed5c-9ca1-b215-a32c07a40140@redhat.com>
Date: Thu, 15 Dec 2022 12:13:50 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [regression] [Bug 216804] Lenovo IdeaPad 5 Flex 14ALC7 trackpad
 does not work past 5.19.10, patch in 6.1 has no effect
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <0dabe251-0182-28d0-705d-d50e27bde39d@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0dabe251-0182-28d0-705d-d50e27bde39d@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/15/22 08:43, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a regression reported in bugzilla.kernel.org that seems to be
> handled there already, nevertheless I'd like to add to the tracking to
> ensure it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: 9946e39fe8d0
> https://bugzilla.kernel.org/show_bug.cgi?id=216804
> #regzbot monitor
> https://lore.kernel.org/all/20221213201311.10022-1-adrian@freund.io/
> #regzbot ignore-activity

A patch fixing this has already been posted, see:

https://lore.kernel.org/linux-acpi/20221213201311.10022-1-adrian@freund.io/

Sorry I don't know what the regzbot command to let regzbot know
about this. Maybe include a link to some regzbot manual / cheat-sheet
in the standard footer of these mails?

Regards,

Hans


