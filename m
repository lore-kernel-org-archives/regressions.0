Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CACE36B
	for <regressions@lists.linux.dev>; Sat, 18 Mar 2023 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679157790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qTmKzr5kfPBVHTLN+KCKhuoURqJ1d0K8awn1mb6e78=;
	b=OWYA3Bk4RGX/MMSh0FERwqO0I8RoOdlVZhkQCjcxRTOhLbSJZ5nNM4TeXvXB1zwnToQaEY
	NIbQ16IJGNkDTesYZiWsh9Ct/kHa5Dl/4RQSCZFS1wYU/SmEbtQopezBfLwZMxljjsgUk3
	JosUvHp5WDsyyc/MsizDdhHgCHyRvR8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-NLDGlMiCPEyn63dCCEsWww-1; Sat, 18 Mar 2023 12:43:08 -0400
X-MC-Unique: NLDGlMiCPEyn63dCCEsWww-1
Received: by mail-ed1-f69.google.com with SMTP id i42-20020a0564020f2a00b004fd23c238beso11807536eda.0
        for <regressions@lists.linux.dev>; Sat, 18 Mar 2023 09:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679157787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qTmKzr5kfPBVHTLN+KCKhuoURqJ1d0K8awn1mb6e78=;
        b=siGOPLg1N8L1wnz3+9wWRWg21zd0xNHlq5hNYdD6SIXy+kLZwAm3Yosgw03CmfOgi0
         axJ7uZfn3Wn/WtqVJ2msmbtLXlzxSeyMcMIlH7F/TiRay0xuUoW6vo3akymo74PF5nE2
         d3yKsAf3kV5ppGfree89ofO9tgEqoT66df5hcm6UkFyWqp7k/Yd5ATyD+PeOz3b0tJWg
         +GZJ+7qbOXKUoujtNsCjZLclwYZ0dwIKFCJhLJ1rQh/rDddDmuyOCG8KsWzChNXbDYd/
         EUV9KBpAObYHxLzUISIQF8OvmzsiUiPNQfhBEEaAWudUOp3NzBslSpdxqCCNEQdsR9kx
         OjIw==
X-Gm-Message-State: AO0yUKWIo4HCaawupQn7Pl9OXIU8VEF8JAz98bI42C5cBLzDsuYLaCTY
	JbgWf4xfPi3EvySFpjU/CvdTdUhK95RUN6hkp+A8IgthFTM57yYQxLI87hupzKDJJpbpBD0aTHA
	bB2hABxEPEHaLG+AfDxJUf7I=
X-Received: by 2002:a05:6402:b2e:b0:4f9:9e56:84bf with SMTP id bo14-20020a0564020b2e00b004f99e5684bfmr6788126edb.10.1679157787628;
        Sat, 18 Mar 2023 09:43:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set89AlppMDrfR/43PIUExvhvMG/jKnG4vsy7XxhESBrvrhiSghtoTblYJc/00XHsLaWp7oYEPw==
X-Received: by 2002:a05:6402:b2e:b0:4f9:9e56:84bf with SMTP id bo14-20020a0564020b2e00b004f99e5684bfmr6788116edb.10.1679157787375;
        Sat, 18 Mar 2023 09:43:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x93-20020a50bae6000000b004fbf6b35a56sm2564415ede.76.2023.03.18.09.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 09:43:06 -0700 (PDT)
Message-ID: <49d10207-6f31-f1a1-90f1-7f8df5a83ee2@redhat.com>
Date: Sat, 18 Mar 2023 17:43:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Input: focaltech - use explicitly signed char type
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, dmitry.torokhov@gmail.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Cc: stable@vger.kernel.org, regressions@leemhuis.info, barry@messagefor.me.uk
References: <e20db4c4-b2a8-bc88-232f-d1213733d20c@leemhuis.info>
 <20230318133010.1285202-1-Jason@zx2c4.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230318133010.1285202-1-Jason@zx2c4.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/18/23 14:30, Jason A. Donenfeld wrote:
> The recent change of -funsigned-char causes additions of negative
> numbers to become additions of large positive numbers, leading to wrong
> calculations of mouse movement. Change these casts to be explictly
> signed, to take into account negative offsets.
> 
> Fixes: 3bc753c06dd0 ("kbuild: treat char as always unsigned")
> Cc: stable@vger.kernel.org
> Cc: regressions@leemhuis.info
> Cc: barry@messagefor.me.uk
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Wrote this patch from my phone, untested, so it would be nice if
> somebody with hardware could confirm it works.

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
>  drivers/input/mouse/focaltech.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/mouse/focaltech.c b/drivers/input/mouse/focaltech.c
> index 6fd5fff0cbff..3dbad0d8e8c9 100644
> --- a/drivers/input/mouse/focaltech.c
> +++ b/drivers/input/mouse/focaltech.c
> @@ -202,8 +202,8 @@ static void focaltech_process_rel_packet(struct psmouse *psmouse,
>  	state->pressed = packet[0] >> 7;
>  	finger1 = ((packet[0] >> 4) & 0x7) - 1;
>  	if (finger1 < FOC_MAX_FINGERS) {
> -		state->fingers[finger1].x += (char)packet[1];
> -		state->fingers[finger1].y += (char)packet[2];
> +		state->fingers[finger1].x += (signed char)packet[1];
> +		state->fingers[finger1].y += (signed char)packet[2];
>  	} else {
>  		psmouse_err(psmouse, "First finger in rel packet invalid: %d\n",
>  			    finger1);
> @@ -218,8 +218,8 @@ static void focaltech_process_rel_packet(struct psmouse *psmouse,
>  	 */
>  	finger2 = ((packet[3] >> 4) & 0x7) - 1;
>  	if (finger2 < FOC_MAX_FINGERS) {
> -		state->fingers[finger2].x += (char)packet[4];
> -		state->fingers[finger2].y += (char)packet[5];
> +		state->fingers[finger2].x += (signed char)packet[4];
> +		state->fingers[finger2].y += (signed char)packet[5];
>  	}
>  }
>  

