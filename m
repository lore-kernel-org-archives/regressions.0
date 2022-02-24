Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B17A
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 16:18:10 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nNGod-0006Ot-5w; Thu, 24 Feb 2022 17:18:03 +0100
Message-ID: <a0ec4d70-35d7-ab32-4561-df77bcc6d0fd@leemhuis.info>
Date: Thu, 24 Feb 2022 17:18:02 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-BW
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Chris Clayton <chris2553@googlemail.com>
Cc: Chris Murphy <lists@colorremedies.com>,
 Bluetooth <linux-bluetooth@vger.kernel.org>, regressions@lists.linux.dev
References: <CAJCQCtSeUtHCgsHXLGrSTWKmyjaQDbDNpP4rb0i+RE+L2FTXSA@mail.gmail.com>
 <CABBYNZKTSe83iP4tm36we4cpAbeGUbEw9frZD1wCM9yo1zry5w@mail.gmail.com>
 <CAJCQCtTpHQe2co3fLNs5csKQchmwH=3YwQOvFnuc2nhjRseVnw@mail.gmail.com>
 <9ad505e1-7b59-7ebf-378b-23a6c0e25802@googlemail.com>
 <CABBYNZ+9tUKgLyUWM5vkMW8vHxYsXv6DEaDWdHt8xTTs6puGQA@mail.gmail.com>
 <aaeb4131-d177-d41e-617b-b0060cd83c92@googlemail.com>
 <CABBYNZLB+8UzhzttMrKbHW_+-A1EsY9iT5Y55VuOOEPuD4kAHQ@mail.gmail.com>
 <b1a4a920-dbba-58be-72b4-2c95b9b79283@googlemail.com>
 <82216882-463a-8976-e6bc-4a8919107a31@googlemail.com>
 <CABBYNZ+mO1gQgfwhemY9cqbi8vNLm_60A9c1vPYT2tH4rhgFww@mail.gmail.com>
 <a35b4b75-bb64-89c8-bacd-d58ed8576272@googlemail.com>
 <2ce6175c-74ec-8469-80a5-374bd1429542@googlemail.com>
 <CABBYNZJNTOT-mEQe2cfZiEX6A2pR7+sacBqtBRPRZY69YmgtvA@mail.gmail.com>
 <17f2bf7e-1d6b-e090-8926-21a408f2b496@googlemail.com>
 <CABBYNZ+cL4f8xvTJFQGLgqPueE=-UsOtvcPQez0BEsJ5xGppfQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: bug kernel 5.17, qualcom and intel adapters, unable to reliably
 connect to bluetooth devices
In-Reply-To: <CABBYNZ+cL4f8xvTJFQGLgqPueE=-UsOtvcPQez0BEsJ5xGppfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645719491;e169cfb4;
X-HE-SMSGID: 1nNGod-0006Ot-5w

On 24.02.22 16:16, Luiz Augusto von Dentz wrote:
> On Thu, Feb 24, 2022 at 2:08 AM Chris Clayton <chris2553@googlemail.com> wrote:
>> On 24/02/2022 08:16, Luiz Augusto von Dentz wrote:
>>> On Wed, Feb 23, 2022 at 9:59 PM Chris Clayton <chris2553@googlemail.com> wrote:
>>>> On 23/02/2022 22:42, Chris Clayton wrote:
> [...]
>> In the meantime I've copied this email to regressions@lists.linux.dev, so they can track this.

Many thx for this, much appreciated.

> Hmm, is that really necessary? 5.17 has not been release tagged yet
> and you are already considering it a regression?

Sure it's a regression, just one that didn't make it into a release yet.
But tracking regressions in mainline is just as important as tracking
them in stable trees, as it allows Linus to take a look at the known
regressions when he needs to decide between "release another rc" and
"call this finished and release the final". That's why mainline in the
past often was the main focus of regression tracking or the only tree
for which is was performed!

> [...]

Ciao, Thorsten
