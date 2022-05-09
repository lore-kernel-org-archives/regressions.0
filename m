Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB487B
	for <regressions@lists.linux.dev>; Mon,  9 May 2022 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652123053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4c+bANNOi4sApJZ1cTVk45/N0JeRAadFfeHChP/lKJw=;
	b=AOieuT286XCFvsWCZuw3zpZ/TbLs+PO/HVz5vE13+JAeUJASJV23vHtytsnmKwEbnBZSmf
	0PVtuMEQlyeQS+sZVxu4/brUTNBRCcObOFDg+/grfBfudd9wm9zab/M22ksy4WCWUpZ7SW
	Fu14tTEDNK53HJzqQT/iVhp0FmJEAvQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-vA1mc7q4PNCatKUkFX0BTw-1; Mon, 09 May 2022 15:04:10 -0400
X-MC-Unique: vA1mc7q4PNCatKUkFX0BTw-1
Received: by mail-ej1-f70.google.com with SMTP id nd34-20020a17090762a200b006e0ef16745cso7185850ejc.20
        for <regressions@lists.linux.dev>; Mon, 09 May 2022 12:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4c+bANNOi4sApJZ1cTVk45/N0JeRAadFfeHChP/lKJw=;
        b=SV1kuc/zyovOdnBunGkv/zpZqOSy2QVMQ0e6N3Pe1ISfg+WmBxSDuUaIkwe85SZ3Gp
         ho6ZJdSzJmcvGSZzkYE/PIQ/wB/cAoe7HWWGgPZFWwvyjDWuxLCXRhWGyETi7lgClMQJ
         1+uKINtrI9fJFWDSHduRj3fkeR9T9AgIb4uJtYldmwymvaVco36BhZfcrkivp6Q8aEni
         LU2UxQOIIpjWw09uh/frOtuI2HQYNr6NcJHTjLt/ZFeBkbK5vPIcMrwsxV8miJSm14S/
         9BFhZtX3c1JPlnD3o5jRu/o2zTh5/K1s1QB17X8Ohb7zHVtBS0zTL9oP00T8MiuXuU3o
         eimg==
X-Gm-Message-State: AOAM533nuJ/8Z0d90diL7Jk5VKKeOtHxPh4Hd0yHAfT6d1eb7tnkBdHW
	dx2mSWN6+FqPElEaVSeYxK2VdLAOodQdFYKN2s6IGO+dtvy1SPHWDnBep9d5yE9tUZh7ahMb5sL
	F8nYh1189cDxOZu23m3fECRM=
X-Received: by 2002:a17:907:2ce6:b0:6f4:7e8e:af40 with SMTP id hz6-20020a1709072ce600b006f47e8eaf40mr15521397ejc.211.1652123049429;
        Mon, 09 May 2022 12:04:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnHAgNoRkHPDpX0mV6CZQzXr55+KlJweOT0EUsiyDdB6Wa4kFRNLe0wYZ20i6JowEuwIgfjQ==
X-Received: by 2002:a17:907:2ce6:b0:6f4:7e8e:af40 with SMTP id hz6-20020a1709072ce600b006f47e8eaf40mr15521374ejc.211.1652123049157;
        Mon, 09 May 2022 12:04:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id w7-20020a170907270700b006f3ef214e49sm5380213ejk.175.2022.05.09.12.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 12:04:08 -0700 (PDT)
Message-ID: <54664f6a-b046-1330-e794-cb533e942a94@redhat.com>
Date: Mon, 9 May 2022 21:04:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Linux regressions report for mainline [2022-05-09] (was: Linux
 5.18-rc6)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAHk-=wi0vqZQUAS67tBsJQW+dtt89m+dqA-Z4bOs8CH-mm8u2w@mail.gmail.com>
 <165209064657.193515.10163777181547077546@leemhuis.info>
 <CAHk-=wj0gHsG6iw3D8ufptm9a_dvTSqrrOFY9WopObbYbyuwnA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHk-=wj0gHsG6iw3D8ufptm9a_dvTSqrrOFY9WopObbYbyuwnA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/9/22 19:20, Linus Torvalds wrote:
> On Mon, May 9, 2022 at 3:47 AM Regzbot (on behalf of Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> Hi Linus! Here's a quick compilation of open reports about regressions in
>> 5.18-rc that I'm currently aware of; most of the reports are quite
>> recent and there afaics is nothing that looks particularly worrisome.
> 
> Well, the Intel GPU issue seems likely to cause problems for lots of people:
> 
>> [ *NEW* ] drm/i915: BYT rendering broken due to "Remove short-term pins from execbuf, v6"
>> -----------------------------------------------------------------------------------------
>> https://linux-regtracking.leemhuis.info/regzbot/regression/1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com/
>> https://lore.kernel.org/dri-devel/1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com/
>>
>> By Hans de Goede; 0 days ago; 2 activities, latest 0 days ago.
>> Introduced in b5cfe6f7a6e1 (v5.18-rc1)
>>
>> Recent activities from: Tvrtko Ursulin (1), Hans de Goede (1)
> 
> Although it looks possible that it mainly affects old chipsets (ie the
> two reports are for a Bay Trail chip and a Core 2 Duo chip - I have no
> idea how they compare).
> 
> That probably means there are a lot of machines out there, but likely
> not the kind that most kernel developers will be testing, so not a ton
> of reports until it hits distro kernels etc.
> 
> It looks like Maarten is already involved.

This is being tracked here:
https://gitlab.freedesktop.org/drm/intel/-/issues/5806

I've just tested a patch from Maarten which fixes things for me,
so hopefully we can get this resolved soon.

Regards,

Hans

