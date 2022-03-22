Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A1A54
	for <regressions@lists.linux.dev>; Tue, 22 Mar 2022 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647947721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+UC/u0PtbhZRKj2jRfChXJZesydUtyvw1SAh08In7c=;
	b=U0Dla9mKY1cVLYOkZNFllCVSIOKMzS8u3eEdcIyxp3/gdpYinh18BmRNMIE/L113cfJfnB
	ZpJYerdZARUpVhxsjqQygK81s/xZkZYQ8/pK82GzZxVNYlo1uADXIyunhMt5qKaT34wLx4
	huAfwcryB+O3CTmiQJauMXRlVI8ZPnk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-KF9qAlHNNsm7kB6FzKgKaQ-1; Tue, 22 Mar 2022 07:15:18 -0400
X-MC-Unique: KF9qAlHNNsm7kB6FzKgKaQ-1
Received: by mail-ej1-f69.google.com with SMTP id gv17-20020a1709072bd100b006dfcc7f7962so4050637ejc.5
        for <regressions@lists.linux.dev>; Tue, 22 Mar 2022 04:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9+UC/u0PtbhZRKj2jRfChXJZesydUtyvw1SAh08In7c=;
        b=Q3VOzfjiervyfQ4XgRmbkXX8XnAo+RrReNaV1lIDnVkUkfM6G5oCP/t/srYz2CiTUa
         cUM0/2BSNq5HDBDsNIYTqM3PcMZHnok8pzdbRe/zE1l9rOCGxqgynYM3pJ8RpfsuTDhA
         JMSIJUV2cILKhwSblGbE1oDEMa2rjEiEPR71R4AZ6rfplWlUDH4nE/reHsPXQrG8xpeP
         AET1M7lNcEIKDXDX+sQvf+9ExApQ/LRZKaKythhA+xBAsHDqOnJYhgHlGgXVWKcSydMg
         i0/YWA+rpbDrIkvogJUPQlXqJqLOcyTydGJDkoxaewVG8ta/WhhZ1hWW2VLTxleARiff
         WtFg==
X-Gm-Message-State: AOAM531Hrr8BMDTbM4/oMsWL7vtt5VeFkKGLosS58XJChJdv/rNaEuW8
	86az63KS4KEU/WnBnGcFeCKMQf6l/L6gkUFJvWF8qFgHaj6kWpiybUu80Dxxnc+Weexb1oD7HXH
	q+w8lmO8bYQDACj1QaoupeWM=
X-Received: by 2002:a17:907:6d0d:b0:6db:f0f8:654d with SMTP id sa13-20020a1709076d0d00b006dbf0f8654dmr25117731ejc.304.1647947717433;
        Tue, 22 Mar 2022 04:15:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztuw0yNJlw73T6KIfQYuamz6XiUFLX3+Qtr0m4cBQUuSF6vyV6Eeh/JUedUW2DEs+W3oFzWQ==
X-Received: by 2002:a17:907:6d0d:b0:6db:f0f8:654d with SMTP id sa13-20020a1709076d0d00b006dbf0f8654dmr25117698ejc.304.1647947717179;
        Tue, 22 Mar 2022 04:15:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id qa44-20020a17090786ac00b006dbe1ca23casm8117781ejc.45.2022.03.22.04.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 04:15:16 -0700 (PDT)
Message-ID: <30340bc0-3a75-cccc-ed98-f80f3ce94627@redhat.com>
Date: Tue, 22 Mar 2022 12:15:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] Revert "Input: clear BTN_RIGHT/MIDDLE on buttonpads"
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 jkosina@suse.cz
Cc: tiwai@suse.de, benjamin.tissoires@redhat.com, regressions@leemhuis.info,
 peter.hutterer@who-t.net, linux-input@vger.kernel.org,
 stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220321184404.20025-1-jose.exposito89@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220321184404.20025-1-jose.exposito89@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/21/22 19:44, José Expósito wrote:
> This reverts commit 37ef4c19b4c659926ce65a7ac709ceaefb211c40.
> 
> The touchpad present in the Dell Precision 7550 and 7750 laptops
> reports a HID_DG_BUTTONTYPE of type MT_BUTTONTYPE_CLICKPAD. However,
> the device is not a clickpad, it is a touchpad with physical buttons.
> 
> In order to fix this issue, a quirk for the device was introduced in
> libinput [1] [2] to disable the INPUT_PROP_BUTTONPAD property:
> 
> 	[Precision 7x50 Touchpad]
> 	MatchBus=i2c
> 	MatchUdevType=touchpad
> 	MatchDMIModalias=dmi:*svnDellInc.:pnPrecision7?50*
> 	AttrInputPropDisable=INPUT_PROP_BUTTONPAD
> 
> However, because of the change introduced in 37ef4c19b4 ("Input: clear
> BTN_RIGHT/MIDDLE on buttonpads") the BTN_RIGHT key bit is not mapped
> anymore breaking the device right click button and making impossible to
> workaround it in user space.
> 
> In order to avoid breakage on other present or future devices, revert
> the patch causing the issue.
> 
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/481 [1]
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=1868789  [2]
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/input.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index c3139bc2aa0d..ccaeb2426385 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -2285,12 +2285,6 @@ int input_register_device(struct input_dev *dev)
>  	/* KEY_RESERVED is not supposed to be transmitted to userspace. */
>  	__clear_bit(KEY_RESERVED, dev->keybit);
>  
> -	/* Buttonpads should not map BTN_RIGHT and/or BTN_MIDDLE. */
> -	if (test_bit(INPUT_PROP_BUTTONPAD, dev->propbit)) {
> -		__clear_bit(BTN_RIGHT, dev->keybit);
> -		__clear_bit(BTN_MIDDLE, dev->keybit);
> -	}
> -
>  	/* Make sure that bitmasks not mentioned in dev->evbit are clean. */
>  	input_cleanse_bitmasks(dev);
>  

