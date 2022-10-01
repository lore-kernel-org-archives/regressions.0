Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1125F185F
	for <regressions@lists.linux.dev>; Sat,  1 Oct 2022 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664627687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZdi4pkGgcpbGzaboCY/MebG3XWkH7xC5AZfZa6cchY=;
	b=fM/DN79U5RspC18GXT0/d1IcCnvB2EUBMiNWlUVpofDsn2sf4ypmuwRFNKk5DT0fAIZB3O
	soR+0JpaRMjVb19S7R/osxYWoFsEUpUj90a1pwk0cgHkh2+xct/bsP8Lgpl6D/Z6oI2F3I
	wJsMrhPTSc7cILtjzfitbmmWFtbJoM8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84--25Xa9c8P7iFDjvnsLAdWw-1; Sat, 01 Oct 2022 08:34:45 -0400
X-MC-Unique: -25Xa9c8P7iFDjvnsLAdWw-1
Received: by mail-ed1-f69.google.com with SMTP id y9-20020a056402270900b00451dfbbc9b2so5428073edd.12
        for <regressions@lists.linux.dev>; Sat, 01 Oct 2022 05:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fZdi4pkGgcpbGzaboCY/MebG3XWkH7xC5AZfZa6cchY=;
        b=1zU3wlq+FWKtWY6Jlcsi5yJE//r4WBPJMSUeD6zP6YpBd9cRZlhFis7UkGg8jzM807
         4nvbR6AUZTGpK0CveCyWDEFiIu3LNBcZBJMI2tPNiDLDUH6YlWE6yOEElTLm81+DAqmG
         QOTkfEC62ak3wIBa3tZdJHKI1J/rgfbNVEFnAn8GUFNtV2IEjvoADbK+HqTl0bolHz+h
         IR1DbpGt+i35RlBfCz10YRi0tB8CT7Auvkdsw69J7i2FW/BtAxYKKWkYesszjk1XAmPI
         XqbDAdbbaL7liNms2HF8Edjn1L6iBO6ydsGTOblopVf8jDQ6K4WmhFBjGITxrc5JgX8y
         NtDA==
X-Gm-Message-State: ACrzQf3is7r3433zb4fk5oILYDYDwDYTY1+A/WNioi+mkFq4vF4/tAPT
	ifKqi5Q4g9QQLcmiCTzLU2LidMHKv4g025u1LxLKPFqBW2ceu0sQqMVVDmj4dovbgNLn2kRCuy1
	Zr9nG7T0JCyB/f9B2XKzOkPU=
X-Received: by 2002:aa7:cc8e:0:b0:457:23db:f0cc with SMTP id p14-20020aa7cc8e000000b0045723dbf0ccmr11553566edt.122.1664627684356;
        Sat, 01 Oct 2022 05:34:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5E2M2+0VAkVEUIPXKI4uS+9F4UcgVmEXN4GUafJR2CwUm2d+C6grswZwpB45bmackhFjpvhw==
X-Received: by 2002:aa7:cc8e:0:b0:457:23db:f0cc with SMTP id p14-20020aa7cc8e000000b0045723dbf0ccmr11553551edt.122.1664627684174;
        Sat, 01 Oct 2022 05:34:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ck15-20020a0564021c0f00b00456ced2b26csm3486406edb.8.2022.10.01.05.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 05:34:43 -0700 (PDT)
Message-ID: <87e6a933-bfa6-8e1a-7f71-d6a08a299568@redhat.com>
Date: Sat, 1 Oct 2022 14:34:42 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Regression on 5.19.12, display flickering on Framework laptop
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Slade Watkins <srw@sladewatkins.net>, Jerry Ling <jiling@cern.ch>
References: <55905860-adf9-312c-69cc-491ac8ce1a8b@cern.ch>
 <YzZynE2FAMNQKm2E@kroah.com> <YzaFq7fzw5TbrJyv@kroah.com>
 <03147889-B21C-449B-B110-7E504C8B0EF4@sladewatkins.net>
 <aa8b9724-50c6-ae2e-062d-3791144ac97e@cern.ch>
 <e3e2915d-1411-a758-3991-48d6c2688a1e@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e3e2915d-1411-a758-3991-48d6c2688a1e@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/1/22 12:07, Thorsten Leemhuis wrote:
> On 30.09.22 14:26, Jerry Ling wrote:
>>
>> looks like someone has done it:
>> https://bbs.archlinux.org/viewtopic.php?pid=2059823#p2059823
>>
>> and the bisect points to:
>>
>> |# first bad commit: [fc6aff984b1c63d6b9e54f5eff9cc5ac5840bc8c]
>> drm/i915/bios: Split VBT data into per-panel vs. global parts Best, Jerry |
> 
> FWIW, that's 3cf050762534 in mainline. Adding Ville, its author to the
> list of recipients.
> 
> Did anyone check if a revert on top of 5.19.12 works easily and solves
> the problem?
> 
> And does anybody known if mainline affected, too?

Sorry for jumping in the middle of the thread. I believe that this is also
reported by Fedora users on a Lenovo Carbon X1 (gen 9) as:

https://bugzilla.redhat.com/show_bug.cgi?id=2130699

So it would be good to add a:

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2130699

tag to the commit which ends up fixing this.

Regards,

Hans





> 
> Ciao, Thorsten
> 
> 
>> On 9/30/22 07:11, Slade Watkins wrote:
>>> Hey Greg,
>>>
>>>> On Sep 30, 2022, at 1:59 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Fri, Sep 30, 2022 at 06:37:48AM +0200, Greg KH wrote:
>>>>> On Thu, Sep 29, 2022 at 10:26:25PM -0400, Jerry Ling wrote:
>>>>>> Hi,
>>>>>>
>>>>>> It has been reported by multiple users across a handful of distros
>>>>>> that
>>>>>> there seems to be regression on Framework laptop (which presumably
>>>>>> is not
>>>>>> that special in terms of mobo and display)
>>>>>>
>>>>>> Ref:
>>>>>> https://community.frame.work/t/psa-dont-upgrade-to-linux-kernel-5-19-12-arch1-1-on-arch-linux-gen-11-model/23171
>>>>> Can anyone do a 'git bisect' to find the offending commit?
>>>> Also, this works for me on a gen 12 framework laptop:
>>>>     $ uname -a
>>>>     Linux frame 5.19.12 #68 SMP PREEMPT_DYNAMIC Fri Sep 30 07:02:33
>>>> CEST 2022 x86_64 GNU/Linux
>>>>
>>>> so there's something odd with the older hardware?
>>>>
>>>> greg k-h
>>> Could be. Running git bisect for 5.19.11 and 5.19.12 (as suggested by
>>> the linked forum thread) returned nothing on gen 11 for me.
>>>
>>> This is very odd,
>>> -srw
>>
>>
> 

