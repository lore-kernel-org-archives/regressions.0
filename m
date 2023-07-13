Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6D2125A0
	for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 11:46:00 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qJuli-0007Xd-JC; Thu, 13 Jul 2023 13:45:58 +0200
Message-ID: <10064cba-f0fe-fbc6-0c3a-97be48360a05@leemhuis.info>
Date: Thu, 13 Jul 2023 13:45:58 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Bugbot for all kernel bugs?
Content-Language: en-US, de-DE
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <8133fcf4-5ed6-204a-ceb1-ee4136e32fb4@leemhuis.info>
 <20230711-encore-hunchback-2d103b@meerkat>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20230711-encore-hunchback-2d103b@meerkat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689248760;1b426e91;
X-HE-SMSGID: 1qJuli-0007Xd-JC

On 11.07.23 22:43, Konstantin Ryabitsev wrote:
> On Mon, Jul 10, 2023 at 07:28:26PM +0200, Thorsten Leemhuis wrote:
>> Hi Konstantin. Is there any hope that bugbot will be usable for all
>> kernel bugs in bugzilla.kernel.org soon? It sounded some weeks ago like
>> that wasn't too far away, that's why I wonder if we might have arrived
>> at a point where this support could be enabled.
> 
> I just need to add a wrapper that would make it more convenient to run as an
> actual service as opposed to in a screen session I've been using for testing
> purposes. Probably a day worth of effort, plus documentation.
>
>> Sorry for bothering you about this, but I'm getting a bit tired by all
>> that tedious man-in-the-middle between reporters and developers to let
>> one group know about things the other did...
> 
> So, we can't easily do "enable for all the bugs" because the bot was written
> with the idea that it would be invoked per-component. Is there a bugzilla
> component (and a matching mailing list) that you have in mind for the bot?

Ugh. :-/ Well, as you can see from a quick search like
https://lore.kernel.org/all/?q=%28nq%3A%22noticed+a+regression+report+in+bugzilla.kernel.org%22+f%3Aleemhuis%29+OR+%28nq%3A%22I+notice+a+regression+report+on+Bugzilla%22+f%3Asanjaya%29
we have to deal will bug reports for many different components. So it
would be great if it could be enabled for all products/components, except:

* all components from the product categories "Alternate Trees",
"Backports project", "Documentation", "kernel.org", and "Tools"

* "Bug Tracker", "klibc/kinit", "module-init-tools", and "Spam" from the
product category "Other"

There might be a few more that are obsolete hidden in the other products
categories (like "PS3" in "Platform Specific/Hardware" or "lguest" in
"Virtualization")

Did I say "Ugh" already? Ohh, seems I did. :-/

So how do you suggest to move forward

Ciao, Thorsten
