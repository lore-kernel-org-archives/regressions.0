Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12128E4D3
	for <regressions@lists.linux.dev>; Sat, 11 Mar 2023 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678532628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R5J6AMnrRcXzt+I/O0ChiKQKBLR4EtyPdwMr9Jqq3Qs=;
	b=NIFyNOx39PBzPrZA9V5D780PbADyUsUNInSyhEf5KeQwmSPSFElr15PtJjSX0JfYCmQFEk
	KQ2epjbHlLS28+BqrN0CvN2lG4cEwt+s7lX/zBK60VKJCZb1brBmDMOkwdcZuFRnhyC4Rj
	BXyWRdoWHBQ2N1gaIW/hhR6+gN0iR7c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-r1NA-bC4PWWSFTXtlkCzGA-1; Sat, 11 Mar 2023 06:03:47 -0500
X-MC-Unique: r1NA-bC4PWWSFTXtlkCzGA-1
Received: by mail-ed1-f71.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso11096931edh.15
        for <regressions@lists.linux.dev>; Sat, 11 Mar 2023 03:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678532626;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5J6AMnrRcXzt+I/O0ChiKQKBLR4EtyPdwMr9Jqq3Qs=;
        b=SACzYodvnmx+OugR/xn7V7IfW0SpnM9Kt5PI0bU+BwRYru51HpyYNGV+huc/S9oUQx
         9gNksSA2sF3GlFwDuwcIFs2mZvknnQ6c6bm6EHxbGuu0uO+kZVnMyyBo04I3TqA0Pc5L
         QQ7yT1BBEq8WR29uDDo11h5eg1zUJgGW3mWOfldhGhY5MQdO+Q9FOEx1p5XVDrsDtQOe
         iLGLlFYxxSOlvXYyARwS3fDpFLiVgSvfS4OqbIwyuyNUVOfXrPreRxSsWXDy7fQhoGY8
         +tJFZ8eCuSoAvRnDCRjwWW2ocgFKsp3X+/bpTUalqM+AHiV7rPY9Pp+oXnS03nESsjuK
         M5kQ==
X-Gm-Message-State: AO0yUKV5FGq+6ktJvoG7FPEjj27HmDUfcZxjLwqnVTg5BZga7F0uQ4YX
	e7G0SJzUpqOvCyISahLvhnwG0GpM8Qo84Yv8zeslvC2wRAZAkibkSswf65JLfXclaVOchjluTF/
	+cX/QhEvNwn8XvAxJ7enpvbU=
X-Received: by 2002:aa7:d714:0:b0:4a2:5f73:d3d2 with SMTP id t20-20020aa7d714000000b004a25f73d3d2mr22955518edq.41.1678532626384;
        Sat, 11 Mar 2023 03:03:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+z3RdYzPB7NNH4vz6C3euW7LL8q3Xo56HBL74ZzcsDrSAmzJYqxuYwdhdRqfkvj5wUVIbkUQ==
X-Received: by 2002:aa7:d714:0:b0:4a2:5f73:d3d2 with SMTP id t20-20020aa7d714000000b004a25f73d3d2mr22955513edq.41.1678532626120;
        Sat, 11 Mar 2023 03:03:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v21-20020a50d595000000b004f9ca99cf5csm909711edi.92.2023.03.11.03.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 03:03:45 -0800 (PST)
Message-ID: <02ba45eb-1970-791a-d922-7b325ea51146@redhat.com>
Date: Sat, 11 Mar 2023 12:03:44 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [REGRESSION] Patch broke WPA auth: Re: [PATCH v2] wifi: cfg80211:
 Fix use after free for wext
To: Hector Martin <marcan@marcan.st>,
 Alexander Wetzel <alexander@wetzel-home.de>, linux-wireless@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: johannes@sipsolutions.net, stable@vger.kernel.org,
 Asahi Linux <asahi@lists.linux.dev>, Ilya <me@0upti.me>,
 Janne Grunau <j@jannau.net>, LKML <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <20230124141856.356646-1-alexander@wetzel-home.de>
 <d6851c2b-7966-6cb4-a51c-7268c60e0a86@marcan.st>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d6851c2b-7966-6cb4-a51c-7268c60e0a86@marcan.st>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hector,

On 3/11/23 10:55, Hector Martin wrote:
> Hi,
> 
> This broke WPA auth entirely on brcmfmac (in offload mode) and probably
> others, including on stable 6.2.3 and 6.3-rc1 (tested with iwd). Please
> revert or fix. Notes below.
> 
> Reported-by: Ilya <me@0upti.me>
> Reported-by: Janne Grunau <j@jannau.net>
> 
> #regzbot introduced: 015b8cc5e7c4d7
> #regzbot monitor:
> https://lore.kernel.org/linux-wireless/20230124141856.356646-1-alexander@wetzel-home.de/

I can confirm this bug, I was seeing broken wifi on brcmfmac with 6.3-rc1
and I was about to start a git bisect for this this morning when I saw
this email.

Reverting 015b8cc5e7c4d7 fixes the broken wifi. Hector, thank you, you
just saved me from a bisect on somewhat slow hardware :)

Regards,

Hans






> 
> On 24/01/2023 23.18, Alexander Wetzel wrote:
>> Key information in wext.connect is not reset on (re)connect and can hold
>> data from a previous connection.
>>
>> Reset key data to avoid that drivers or mac80211 incorrectly detect a
>> WEP connection request and access the freed or already reused memory.
>>
>> Additionally optimize cfg80211_sme_connect() and avoid an useless
>> schedule of conn_work.
>>
>> Fixes: fffd0934b939 ("cfg80211: rework key operation")
>> Cc: stable@vger.kernel.org
>> Link: https://lore.kernel.org/r/c80f04d2-8159-a02a-9287-26e5ec838826@wetzel-home.de
>> Signed-off-by: Alexander Wetzel <alexander@wetzel-home.de>
>>
>> ---
>> V2 changes:
>> - updated comment
>> - reset more key data
>>
>> ---
>>  net/wireless/sme.c | 31 ++++++++++++++++++++++++++-----
>>  1 file changed, 26 insertions(+), 5 deletions(-)
>>
>> diff --git a/net/wireless/sme.c b/net/wireless/sme.c
>> index 123248b2c0be..0cc841c0c59b 100644
>> --- a/net/wireless/sme.c
>> +++ b/net/wireless/sme.c
> [snip]
>> @@ -1464,6 +1476,15 @@ int cfg80211_connect(struct cfg80211_registered_device *rdev,
> 
> This if branch only fires if the connection is WEP.
> 
>>  	} else {
>>  		if (WARN_ON(connkeys))
>>  			return -EINVAL;
>> +
>> +		/* connect can point to wdev->wext.connect which
>> +		 * can hold key data from a previous connection
>> +		 */
>> +		connect->key = NULL;
>> +		connect->key_len = 0;
>> +		connect->key_idx = 0;
> 
> And these are indeed only used by WEP.
> 
>> +		connect->crypto.cipher_group = 0;
>> +		connect->crypto.n_ciphers_pairwise = 0;
> 
> But here you're killing the info that is used for *other* auth modes too
> if !WEP, breaking WPA and everything else.
> 
>>  	}
>>  
>>  	wdev->connect_keys = connkeys;
> 
> - Hector
> 

