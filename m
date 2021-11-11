Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF822C81
	for <regressions@lists.linux.dev>; Thu, 11 Nov 2021 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636622700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XoIxLEENy2F1Zskv5/PoD5j6jmD+4MPXDSF/F9jQnm4=;
	b=S+4Z4z0VCGJ4JV80lSh/R9IRk17Q5RLrYlQfYsQhpk4svPRsQQDauKn8gxX355glaPIlLy
	IodihxzWV8eUx7Uvnd7qb42Z/tWluATihq4c8hCvFLzISg6zaIHdYWtNIBQGm/ZWEWZXtR
	hwALAzH0jHVHckb9AG6KXSMIHO4X3U0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-aA95VpgmOgK0MQSAZFUOtA-1; Thu, 11 Nov 2021 04:24:59 -0500
X-MC-Unique: aA95VpgmOgK0MQSAZFUOtA-1
Received: by mail-wm1-f71.google.com with SMTP id v10-20020a1cf70a000000b00318203a6bd1so2408916wmh.6
        for <regressions@lists.linux.dev>; Thu, 11 Nov 2021 01:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=XoIxLEENy2F1Zskv5/PoD5j6jmD+4MPXDSF/F9jQnm4=;
        b=HwM4kpe8qnrHTGG0EKvYlOuBQeyVT19tKdoBG5vD5HBnLkKQUOpNKKyvNzo3pyloMv
         SW1CosxNQp4BE9M/AS5VfcehX6/rr0tW78u1b1QxSPZW767yN9a6p9O/DpzWAhQdvtp3
         6Gz2djP6TIlK+xKJgTsubYpFyZo8lZN+VctmdPXkRimSocG7nUTecusGyFKXRI6k5WAx
         MGFiXP7FpmzU/28NiEpF3we0YX9A4puYmYJAyhf/1rzrsk2x0t8N8S6lwDFoEKcboGVm
         Z5JqmZDQOCyw47t4+wz4G471GrbOhO514Jq4hhLwM0Eycuq+j2KDk3QPekhjM+Min2oc
         dilg==
X-Gm-Message-State: AOAM532XIT+g2TWlGgzQc/z+KNeAwXdR0IWhWr7CdpvUmuItwHnAcdAq
	3eb4J4vT9DLezg+CCdchI5OtcbbSzie0LzoUphfeM6yEkm0W2N1kYBb6CcrqDKp4eUO7jSTfdpM
	e3yNcUGBbhMNNpjgnnCiZ7XI=
X-Received: by 2002:a05:6000:18ad:: with SMTP id b13mr7062529wri.195.1636622698147;
        Thu, 11 Nov 2021 01:24:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/L5EBwaiQ5M/k0471vvBJxC4do3fiwU7k3yCJtLLPx+phRd7gimWqthqE//nDPulozzVurg==
X-Received: by 2002:a05:6000:18ad:: with SMTP id b13mr7062518wri.195.1636622697991;
        Thu, 11 Nov 2021 01:24:57 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id l26sm2293227wms.15.2021.11.11.01.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 01:24:57 -0800 (PST)
Message-ID: <1ddb9e88-1ef8-9888-113b-fd2a2759f019@redhat.com>
Date: Thu, 11 Nov 2021 10:24:56 +0100
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
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ilya Trukhanov <lahvuun@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-pm@vger.kernel.org, tzimmermann@suse.de,
 ardb@kernel.org, rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
 <627b6cd1-3446-5e55-ea38-5283a186af39@redhat.com>
 <20211111004539.vd7nl3duciq72hkf@lahvuun>
 <af0552fb-5fb5-acae-2813-86c32e008e58@redhat.com>
In-Reply-To: <af0552fb-5fb5-acae-2813-86c32e008e58@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/21 08:31, Javier Martinez Canillas wrote:

[snip]

>>> And for each check /proc/fb, the kernel boot log, and if Suspend-to-RAM works.
>>>
>>> If the explanation above is correct, then I would expect (1) and (2) to work and
>>> (3) to also fail.
>>>
> 
> Your testing confirms my assumptions. I'll check how this could be solved to
> prevent the efifb driver to be probed if there's already a framebuffer device.
> 

I've posted [0] which does this and also for the simplefb driver.

[0]: https://lore.kernel.org/dri-devel/20211111092053.1328304-1-javierm@redhat.com/T/#u

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

