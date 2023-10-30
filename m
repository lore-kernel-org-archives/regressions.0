Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0BE53A6
	for <regressions@lists.linux.dev>; Mon, 30 Oct 2023 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qxUVm-0001ed-Q8; Mon, 30 Oct 2023 16:49:06 +0100
Message-ID: <6e9968a0-c511-4a29-aec5-42892b8254d2@leemhuis.info>
Date: Mon, 30 Oct 2023 16:49:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Linux regressions report for mainline [2023-10-29]
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <169858752781.1095326.10615907253726224231@leemhuis.info>
 <CAHk-=wgEHNFHpcvnp2X6-fjBngrhPYO=oHAR905Q_qk-njV31A@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAHk-=wgEHNFHpcvnp2X6-fjBngrhPYO=oHAR905Q_qk-njV31A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698680955;c2af3158;
X-HE-SMSGID: 1qxUVm-0001ed-Q8

On 29.10.23 18:19, Linus Torvalds wrote:
> On Sun, 29 Oct 2023 at 03:52, Regzbot (on behalf of Thorsten Leemhuis)
> <regressions@leemhuis.info> wrote:
> 
>> * There was another report about a blank screen during boot on a Lenovo
>> laptop because simpledrm (that users apparently had enabled without
>> problems beforehand) started to support those machines due to
>> 60aebc9559492c ("drivers/firmware: Move sysfb_init() from
>> device_initcall to subsys_initcall_sync"). I suggested a revert, but the
>> developers disagree (to quote: "From my point of view, this is not a
>> regression, 60aebc9559492c doesn't cause a problem, but exposes a
>> problem.")
> 
> Honestly, "exposes a problem" is pretty much the *definition* of a
> regression. So that excuse is particularly bad.
> 
> The whole point of "regression" is "things that used to work no longer work".
> 
> And no, "there's another bug that needs to be fixed" is _not_ the
> answer - not unless you have that fix in hand.

Thx for stating it so clearly. I had tried to get that point across, but
failed despite some links to LKML messages from you that covered similar
situations.

This happens frequently, which is tiresome and draining for me. I wish
we had *your* overall view on what regressions and how they are meant to
be handled written up in one short text you explicitly vetted. That
might give me a better lever and makes things easier for maintainers as
well, especially new ones.

See the text below[1] to give you a rough idea what kind of text I'm
thinking of.

The beginning of the merge window is a bad time to bring this up for
discussion, especially when your also traveling. So I will let this rest
for now and get back to you. Unless you say "that's a bad idea, don't
waste your time on it".

> That said, this already went into 6.5, so I'm not going to revert it
> now just before the 6.6 release. That would be more dangerous than
> just letting things be.

Yup, fully agreed. Thx again for looking into this.

Ciao, Thorsten


[1] here is something I quickly complied

"""
Linus "no regressions rule"
---------------------------

The goal
~~~~~~~~

People should always feel like they can update to a new kernel version
without worrying anything might break.


What qualifies as regression
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It's a regression if some practical use case running fine with one Linux
version works worse or not at all with a newer version compiled using a
similar configuration.

To elaborate:

* The aspect "works worse" includes higher power consumption or lower
performance, unless the difference is minor.

* Among the things that do not qualify as "practical use case" are
legacy museum style equipment, ABI/API test scripts, and microbenchmarks.

* It's irrelevant if the change causing the regression only does so by
exposing a problem that beforehand was silently lurking somewhere else
(hardware, firmware, userland, or some other part of the kernel).

* It's irrelevant if a change is fixing some undefined behavior or a bug.

* It's irrelevant if users could easily avoid the problem somehow, e.g.
by changing the configuration or updating some other software (this
includes firmware stored in the device or shipped in the linux-firmware
package).

* A "similar configuration" usually means that the .config of the old
kernel was taken as base for the newer one and processed with
"olddefconfig".

* Old and new kernel versions obviously must both be untainted vanilla
kernels.


How to handle regression report
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[FIXME: this section is missing for now this requires some more thought;
I guess what's needed here is basically the very essence of what
Documentation/process/handling-regressions.rst outlines in "Expectations
and best practices for fixing regressions"]


Closing words
~~~~~~~~~~~~~

Reality is never entirely black-and-white, therefore in rare cases
exceptions will not be fixed.

For example, sometimes it is impossible to resolve a security
vulnerability without causing a regression. That being said, developers
should try hard to avoid such an outcome and when unable to do so
minimize the impact as much as possible.

Another example: regressions only found years after the culprit was
merged might be handled like regular bugs or not addressed at all, as
the developers which introduced it might have moved on to other endeavors.
"""
