Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EBD2F56
	for <regressions@lists.linux.dev>; Wed, 11 May 2022 20:54:22 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id a11so3015849pff.1
        for <regressions@lists.linux.dev>; Wed, 11 May 2022 13:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QV6Lz2aGs3anXJW4RYiy6Oo8doNy37ZheOo8iqMeyZc=;
        b=iA99rpcmBzeEFSjsItohY9n35a4ST68mji3JjLkvtvtg89fRWoyXOiMsMpz5gSC4kx
         x1ghp/xOg0FCXeLNOhGt7aSGYbhxwptIq2IeTWDN2EzDiJ7W4hKdsh3oRc/ULM5rSfWu
         Zyo+/1u6z+YD+rNsuDe+kTrAmVgIZHu8DDXz1ZxoI91iqxBs71HZRHxxHnYiZPjy4Yl0
         rlOD/qDIa+6SMUbmiBacTswBVDTVbU4jmeKDUjH5P4u+u4jSzum1wxUgZSESlqC55FAR
         Q/kDi6zuwb48bfUHblH2aGPxoCgoGtmMB3SasPrZggdMFsVPdP/GGLIrEnmBRjgshEdH
         DSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QV6Lz2aGs3anXJW4RYiy6Oo8doNy37ZheOo8iqMeyZc=;
        b=nl/JkFOmjuj5ksg5GIiteaph0vxEo08Jv5ptSx5Oja64xFYTqTt83DdJO8p++sJaDq
         zeQ0bh7X0e0lzegqDnZk5/R+of/Ytr2kZIYXx73vTJD6t4NOq5YOJPEUY/zlFcb0E1qu
         B41N74U40JBFvRv5v3/DKHY9ibzUDVScLk3QAa5EsK4/ZQc91+09B7LPr5FmFhG62hxp
         UBEVO6BWj2ii4OxFxPtdmyNrLU8+4sc/HkwWy7LPmePb11DvB5T9P7WM5pwfFCD+BqWa
         Wo1XAuLzfNiPOtS7AhAuYsJkV69kwngOgj/1VZAZz+MCnalHlYz5jSRhYax+zSzuwJ4L
         GiOw==
X-Gm-Message-State: AOAM533Ai9q+LlV3D8OB+1f6Na5UAc4mgi3bU8wsOeE6SkHMI76nUtkJ
	F3Bbh+Z310ONOP6dKh0RsGY=
X-Google-Smtp-Source: ABdhPJzr8f9t0y8LGvXFf9E1amAAkPWPQmK7W4sPkYo8GzGbDOSDYoPTWukDpxE5xoYHHmtYoOcBjw==
X-Received: by 2002:a65:6954:0:b0:3c6:42cd:bd38 with SMTP id w20-20020a656954000000b003c642cdbd38mr21863158pgq.331.1652302462089;
        Wed, 11 May 2022 13:54:22 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q5-20020a170903204500b0015e8ddeac5dsm2240770pla.252.2022.05.11.13.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 13:54:21 -0700 (PDT)
Message-ID: <aaa4b4d5-486d-869c-10b7-f88c87c450fd@gmail.com>
Date: Wed, 11 May 2022 13:54:16 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/4] PCI: brcmstb: Revert subdevice regulator stuff
Content-Language: en-US
To: Cyril Brulebois <kibi@debian.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
 regressions@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>
References: <20220511201856.808690-1-helgaas@kernel.org>
 <f9be7d36-d670-ef6c-8877-5b38e828e97f@gmail.com>
 <20220511203946.nr2qqzjlintrgxmi@mraw.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220511203946.nr2qqzjlintrgxmi@mraw.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/11/22 13:39, Cyril Brulebois wrote:
> Florian Fainelli <f.fainelli@gmail.com> (2022-05-11):
>> How about we get a chance to fix this? Where, when and how was this even
>> reported?
> 
> I started downstream:
>    https://bugs.debian.org/1010365
> 
> did some more debugging and moved upstream (the link is mentioned in
> each commit message) roughly 10 days ago:
>    https://bugzilla.kernel.org/show_bug.cgi?id=215925
> 
> As I wrote in response to Thorsten Leemhuis (regressions@), who looped
> in a bunch of people:
> 
>     I had spent so much time bisecting that issue that I concentrated on
>     trying to summarize it properly in Bugzilla, failing to check
>     reporting guidelines and best practices (I even missed the
>     Regression: yes flag in my initial submission).
> 
> Again, sorry for failing to notify everyone in the first place, I tried
> to have the contents of the report squared away.
> 
> That being said, as mentioned on regressions@ & linux-pci@, I'm happy to
> test any attempts at fixing the issue, instead of a full-on revert. I'll
> also try to track mainline more closely, so that such obvious issues
> don't go unnoticed for ~1.5 release cycles.

No worries, I don't have a CM4 board at the moment but will try to order 
one so we can get to the bottom of this quicker.
-- 
Florian
