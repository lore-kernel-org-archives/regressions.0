Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B223206
	for <regressions@lists.linux.dev>; Fri,  9 Sep 2022 18:31:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c2-20020a1c3502000000b003b2973dafb7so5176851wma.2
        for <regressions@lists.linux.dev>; Fri, 09 Sep 2022 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VtS7PbDmPvc8AiYt35hlNpvuYkClVGKCtod6MiUG9ts=;
        b=RkU1DBYgwRsITqk09LgwXa0wxjqaQhNzXihljRMOjLyVixFo4bMVPse+nUzkQtwo3L
         etH7VeR93TL2GHro5WHS20IKYYapGGRzjvpZaVG0bES1gJqes1fqn6BUTAGkhM3Nxzd2
         uVzKmI2toN35lSqslJLisR6ag8ZDES2b77rMF2WYese3SBTOQ4nq9GAca+wAiBtbGGrA
         Z3kq1hOl9yGPGgvFbcQH16FCEgTYj5xaG8H4izPb46TEyJpi2Bnq65vvm0SfUyJhLt9R
         bRnxZ5KbF0FS3XC8Hv+z0Yza5TZvzfwxrSLdqwAc1DuL9A4Ro9WCJ8+27HEpl79XZH38
         D+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VtS7PbDmPvc8AiYt35hlNpvuYkClVGKCtod6MiUG9ts=;
        b=hvB9GvHAatcRQJQEgN76rUFsSmcAtI/5IkCNMlEqniMANWpfF2nAk8iXJD70hkCHor
         7KP2uq17EHqJonlLDgALNxZd+m0Xng3zLfema9LiRlm2cki6OBk0XDlBLIQwC+V9LurG
         pj4LgmVTEGWGuVqme40FzUzpXOOjMqYxCFD6jmCaJVu0aBQEYm1RXa7jO1tVUrXHPmCR
         /3w2X+7J2wXjKh4NxlhGsvu0OkuS7ooY55lFo9cvRl+Uq7i5z1NxgpcSgurOk6CryuyA
         O5kE59FrbXPw/U8R4MrS4JdZFerv31n3Lm8UNDzhmlbou6mQ8+f09/FXtAXjSEJ4x5dA
         POKQ==
X-Gm-Message-State: ACgBeo3L4vXYX8r7F/UYK7hMI1CrJoJFtRIOiXnG6QCylRSKM7cihBnU
	C7i3Rwurmg8/YhsjU9Fjuao=
X-Google-Smtp-Source: AA6agR6qziD+ro1TyiWVCZJsQCu7whSP7P50JQO9E2aKW3fQr7sNTXW/rA5ux2t4CqXmt5zGxdTFJA==
X-Received: by 2002:a7b:ce97:0:b0:3b3:4136:59fe with SMTP id q23-20020a7bce97000000b003b3413659femr3862997wmj.24.1662748293800;
        Fri, 09 Sep 2022 11:31:33 -0700 (PDT)
Received: from [192.168.1.10] (2e41ab4c.skybroadband.com. [46.65.171.76])
        by smtp.googlemail.com with ESMTPSA id n18-20020a05600c501200b003a846a014c1sm1433947wmr.23.2022.09.09.11.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 11:31:33 -0700 (PDT)
Message-ID: <702fb195-93a9-10f8-7890-2cb6c3cefea3@googlemail.com>
Date: Fri, 9 Sep 2022 19:31:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: b118509076b3 (probably) breaks my firewall
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 regressions@lists.linux.dev
References: <e5d757d7-69bc-a92a-9d19-0f7ed0a81743@googlemail.com>
 <20220908191925.GB16543@breakpoint.cc>
 <78611fbd-434e-c948-5677-a0bdb66f31a5@googlemail.com>
 <20220908214859.GD16543@breakpoint.cc> <YxsTMMFoaNSM9gLN@salvia>
 <a3c79b7d-526f-92ce-144a-453ec3c200a5@googlemail.com>
In-Reply-To: <a3c79b7d-526f-92ce-144a-453ec3c200a5@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[the address I used for regressions was bounced. Using the right one...]

On 09/09/2022 19:21, Chris Clayton wrote:
> 
> 
> On 09/09/2022 11:19, Pablo Neira Ayuso wrote:
>> On Thu, Sep 08, 2022 at 11:48:59PM +0200, Florian Westphal wrote:
>>> Chris Clayton <chris2553@googlemail.com> wrote:
>>>
>>> [ CC Pablo ]
>>>
>>>> On 08/09/2022 20:19, Florian Westphal wrote:
>>>>> Chris Clayton <chris2553@googlemail.com> wrote:
>>>>>> Just a heads up and a question...
>>>>>>
>>>>>> I've pulled the latest and greatest from Linus' tree and built and installed the kernel. git describe gives
>>>>>> v6.0-rc4-126-g26b1224903b3.
>>>>>>
>>>>>> I find that my firewall is broken because /proc/sys/net/netfilter/nf_conntrack_helper no longer exists. It existed on an
>>>>>> -rc4 kernel. Are changes like this supposed to be introduced at this stage of the -rc cycle?
>>>>>
>>>>> The problem is that the default-autoassign (nf_conntrack_helper=1) has
>>>>> side effects that most people are not aware of.
>>>>>
>>>>> The bug that propmpted this toggle from getting axed was that the irc (dcc) helper allowed
>>>>> a remote client to create a port forwarding to the local client.
>>>>
>>>>
>>>> Ok, but I still think it's not the sort of change that should be introduced at this stage of the -rc cycle.
>>>> The other problem is that the documentation (Documentation/networking/nf_conntrack-sysctl.rst) hasn't been updated. So I
>>>> know my firewall is broken but there's nothing I can find that tells me how to fix it.
>>>
>>> Pablo, I don't think revert+move the 'next' will avoid this kinds of
>>> problems, but at least the nf_conntrack-sysctl.rst should be amended to
>>> reflect that this was removed.
>>
>> I'll post a patch to amend the documentation.
>>
>>> I'd keep it though because people that see an error wrt. this might be
>>> looking at nf_conntrack-sysctl.rst.
>>>
>>> Maybe just a link to
>>> https://home.regit.org/netfilter-en/secure-use-of-helpers/?
>>>
> but
> I'm afraid that document isn't much use to a "Joe User" like me. It's written by people who know a lot about the subject
> matter to be read by other people who know a lot about the subject matter.
> 
>>> What do you think?
>>
>> I'll update netfilter.org to host a copy of the github sources.
>>
>> We have been announcing this going deprecated for 10 years...
> 
> 
> That may be the case, it should be broken before -rc1 is released. Breaking it at -rc4+ is, I think, a regression!
> Adding Thorsten Leemuis to cc list
