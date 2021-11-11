Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FC2168
	for <regressions@lists.linux.dev>; Thu, 11 Nov 2021 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636615877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZYQEw5GVtmhIImAbCeB41t1wheO6mxsaCZLTEEKlNIY=;
	b=If0xiAVKqkEvAjK4aHEiw60HXIEYCStFaOVz1p4ERFog1/BhmdHjZs5UvgW4xDhIP/qMIG
	U3oAC8sfb0foingle3NcTHPs7S0/yVynCTLnUybDAiazIvK1FhoWDmVNrMI+4FH1ur3EKl
	e0u1h9zaI1cRxDIdJM6VSItEZkP4yrc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-vv8KGWt4NhKyzAIKO7rzhQ-1; Thu, 11 Nov 2021 02:31:14 -0500
X-MC-Unique: vv8KGWt4NhKyzAIKO7rzhQ-1
Received: by mail-wr1-f69.google.com with SMTP id k8-20020a5d5248000000b001763e7c9ce5so832381wrc.22
        for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 23:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZYQEw5GVtmhIImAbCeB41t1wheO6mxsaCZLTEEKlNIY=;
        b=IVuinCyTU1YoHtj/z6KaTBLhJjj4NceScijCcACM3Lz6UPPXoMN8vuuq8Yjqczcccp
         BDDym+I70sZYIyPmRIXW1xgmkk/g6Qqn63KoE/lQLUhi6iJi6VdmKea/Ucp7nDKbj3ZN
         V/YlbXwom8a2sIlOH3qnXUq2tkksqqocaWkjaVIiMFRgREAc9zz/nJOMBuuTEw/Sdztf
         D7zBZsqZOlj99wYi1DBPWiGwL3lTFddEQL3QRBPhY0HJWJYaeE8AnESiHIpk+g/RPBgN
         4l+VfIHga5vtbTIW/IfSAFnWVkTxgKhLE12QxfNPovAyjkxmhremPfjB6PRfVHzCH0j1
         Zkvw==
X-Gm-Message-State: AOAM531n7auQTmn+WuJKhUhs7ylkSerB/trIqpmmEptlKCbK7k17PYJp
	aLj0miiH+Tp9G9wyXBUfGFl3kYL/35kZHVtYCVrQRGCkhQjonPG6DkpuiJX7QnKsw9diS6+1o6V
	NhzoW4G2XDuQ7ImlbbM5fzEU=
X-Received: by 2002:adf:ee04:: with SMTP id y4mr6361292wrn.0.1636615873229;
        Wed, 10 Nov 2021 23:31:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1JLpDvD1ipMwjqp3XjHqiTZwSRafDcbKcys/CZyMEO92UHHU3jo67AkcjMz8ueVY4Z8KreA==
X-Received: by 2002:adf:ee04:: with SMTP id y4mr6361266wrn.0.1636615873037;
        Wed, 10 Nov 2021 23:31:13 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id h1sm1962703wmb.7.2021.11.10.23.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 23:31:12 -0800 (PST)
Message-ID: <af0552fb-5fb5-acae-2813-86c32e008e58@redhat.com>
Date: Thu, 11 Nov 2021 08:31:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [REGRESSION]: drivers/firmware: move x86 Generic System
 Framebuffers support
To: Ilya Trukhanov <lahvuun@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-pm@vger.kernel.org, tzimmermann@suse.de,
 ardb@kernel.org, rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
 <627b6cd1-3446-5e55-ea38-5283a186af39@redhat.com>
 <20211111004539.vd7nl3duciq72hkf@lahvuun>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211111004539.vd7nl3duciq72hkf@lahvuun>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Ilya,

On 11/11/21 01:45, Ilya Trukhanov wrote:

[snip]

>> Can you please share the kernel boot log for any of these cases too ?
>

Thanks a lot for the testing and providing the info!
 
>> This is just a guess though. Would be good if you could test following cases:
>>
>> 1) CONFIG_FB_EFI not set
> 
> /proc/fb:
> 0 amdgpu
> 
> dmesg: https://pastebin.com/c1BcWLEh
> 
> Suspend-to-RAM works.
> 
>> 2) CONFIG_FB_EFI=y and CONFIG_DRM_AMDGPU=m
> 
> /proc/fb before `modprobe amdgpu`:
> 0 EFI VGA
> 
> after:
> 0 amdgpu
> 
> dmesg: https://pastebin.com/vSsTw2Km
> 
> Suspend-to-RAM works.
> 
>> 3) CONFIG_SYSFB_SIMPLEFB=y and CONFIG_FB_SIMPLE=y
> 
> /proc/fb:
> 0 amdgpu
> 1 simple
> 
> dmesg: https://pastebin.com/ZSXnpLqQ
> 
> Suspend-to-RAM fails.
> 
>>
>> And for each check /proc/fb, the kernel boot log, and if Suspend-to-RAM works.
>>
>> If the explanation above is correct, then I would expect (1) and (2) to work and
>> (3) to also fail.
>>

Your testing confirms my assumptions. I'll check how this could be solved to
prevent the efifb driver to be probed if there's already a framebuffer device.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

