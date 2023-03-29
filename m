Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877E07B
	for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 10:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680086047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WV+o+6BPdaDM+LpqzyXbB5Lv5klnj7u4YwO4RzzAR4=;
	b=Mp7hpPX83tgRDF3FNYBrtpQB7k7LvxQqaL2LYSJXa9+tAUBoT0fWNkJwu3JOu9GqYRrk2Q
	fj7A2AOF4o/cNxx2rDGiwh/K4ghNe32bBADaN6FsZ290RkTVcUsFgRJx0LRRthDMr0Rgo4
	T5OK8ldjlqj1NLa2w6w3b0SwSJ8umfA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-bUDJdsmGNRWv30MypBuyLw-1; Wed, 29 Mar 2023 06:34:06 -0400
X-MC-Unique: bUDJdsmGNRWv30MypBuyLw-1
Received: by mail-ed1-f71.google.com with SMTP id a40-20020a509eab000000b005024c025bf4so9381222edf.14
        for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 03:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680086045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WV+o+6BPdaDM+LpqzyXbB5Lv5klnj7u4YwO4RzzAR4=;
        b=L3JEJywlWnkxSdAUC/pdqRKV9wGdhuDFEKX5GlHLYceNureWiCh7eRUAjCJKYl/gR4
         NR5clRqbKTXVQdbfyJ8mdqMGfiZQ+uDvdAGL+Mn8Cp9e852QZJPjUgqVfG9c/IidhGXO
         ONfmy1CRzuTsgaHfNmD1CJuP/cOUWTpdR+UWKdsoXJ9yXgbtcGKWXBCXntm9mO0DinG3
         WVO55RzW6mcUr62NDpZe29jpuy1cA8qAWUsu7Obmzy72J87UFuxw/gVisFnV6mC2zR1H
         n/CPZR2a63ucW4KxfowjubaRNvEgE21eJQR0gFQYqXvca9HjuuepfRgHyXQWmuK/Yjj8
         Q+nA==
X-Gm-Message-State: AAQBX9dBhw6VqqEObdr6HXwJJMcIMMwq2aAQ/Ql3sxhUAWvWrJtmuTu5
	3awqyjsRgOER9m+TfqOl6Y1vBE13t5AbtIXsD4Btm1okpns2YUX+LHjt+LqJLuNkz6b7wAzkZuN
	wzFwqX4jwkta9hmYflOFZA6E=
X-Received: by 2002:a17:906:4492:b0:931:d277:78a4 with SMTP id y18-20020a170906449200b00931d27778a4mr19509520ejo.30.1680086044857;
        Wed, 29 Mar 2023 03:34:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z57CBpiseFMIgnGNryXrCZSYDx0tr+2VtzalweO0jAD5KLEw2kHf2+a73sKHZ56RkovxiFYw==
X-Received: by 2002:a17:906:4492:b0:931:d277:78a4 with SMTP id y18-20020a170906449200b00931d27778a4mr19509506ejo.30.1680086044568;
        Wed, 29 Mar 2023 03:34:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rk28-20020a170907215c00b00933b38505f9sm13763006ejb.152.2023.03.29.03.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 03:34:03 -0700 (PDT)
Message-ID: <5a6150d9-3410-b453-b4f2-c25b85d9a4d2@redhat.com>
Date: Wed, 29 Mar 2023 12:34:02 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6.2 regression fix] drm/nouveau/kms: Fix backlight
 registration
To: Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev, Mark Pearson <mpearson@lenovo.com>
References: <20230326205433.36485-1-hdegoede@redhat.com>
 <3b14406294755cde2b2be6ba54dc09105c071775.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3b14406294755cde2b2be6ba54dc09105c071775.camel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/29/23 00:23, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> (Also note to Mark: this is my way of letting you know someone fixed the
> regression with backlight controls upstream, looking into the weird bright
> screen after resume issue)

Thanks.

I have pushed this to drm-misc-fixes now.

I'll also submit a downstream Fedora kernel pull-req with this
to get this resolved in the Fedora kernels .

Regards,

Hans



> 
> On Sun, 2023-03-26 at 22:54 +0200, Hans de Goede wrote:
>> The nouveau code used to call drm_fb_helper_initial_config() from
>> nouveau_fbcon_init() before calling drm_dev_register(). This would
>> probe all connectors so that drm_connector->status could be used during
>> backlight registration which runs from nouveau_connector_late_register().
>>
>> After commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
>> the fbdev emulation code, which now is a drm-client, can only run after
>> drm_dev_register(). So during backlight registration the connectors are
>> not probed yet and the drm_connector->status == connected check in
>> nv50_backlight_init() would now always fail.
>>
>> Replace the drm_connector->status == connected check with
>> a drm_helper_probe_detect() == connected check to fix nv_backlight
>> no longer getting registered because of this.
>>
>> Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
>> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/202
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> index 40409a29f5b6..91b5ecc57538 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> @@ -33,6 +33,7 @@
>>  #include <linux/apple-gmux.h>
>>  #include <linux/backlight.h>
>>  #include <linux/idr.h>
>> +#include <drm/drm_probe_helper.h>
>>  
>>  #include "nouveau_drv.h"
>>  #include "nouveau_reg.h"
>> @@ -299,8 +300,12 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>>  	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>>  	struct nvif_object *device = &drm->client.device.object;
>>  
>> +	/*
>> +	 * Note when this runs the connectors have not been probed yet,
>> +	 * so nv_conn->base.status is not set yet.
>> +	 */
>>  	if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)) ||
>> -	    nv_conn->base.status != connector_status_connected)
>> +	    drm_helper_probe_detect(&nv_conn->base, NULL, false) != connector_status_connected)
>>  		return -ENODEV;
>>  
>>  	if (nv_conn->type == DCB_CONNECTOR_eDP) {
> 

