Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0C6487AF
	for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r8hu3-0008JJ-9R; Thu, 30 Nov 2023 15:20:31 +0100
Message-ID: <8aa65e6a-9d39-4831-afdc-a9cb3f577e3b@leemhuis.info>
Date: Thu, 30 Nov 2023 15:20:30 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Boot hangs when SLUB_DEBUG_ON=y and KASAN_GENERIC=y
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
References: <cover.1700502145.git.andreyknvl@google.com>
 <5cef104d9b842899489b4054fe8d1339a71acee0.1700502145.git.andreyknvl@google.com>
 <CAB=+i9Q95W+w=-KC5vexJuqVi60JJ1P8e-_chegiXOUjB7C3DA@mail.gmail.com>
 <CAB=+i9Re7BY96_eBjNUct9kdRqkXNXQ1UdYdQxtZ30vEyCT0=g@mail.gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAB=+i9Re7BY96_eBjNUct9kdRqkXNXQ1UdYdQxtZ30vEyCT0=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1701354033;7b479006;
X-HE-SMSGID: 1r8hu3-0008JJ-9R

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 22.11.23 13:37, Hyeonggon Yoo wrote:
> On Wed, Nov 22, 2023 at 12:17 PM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
>> On Tue, Nov 21, 2023 at 1:08 PM <andrey.konovalov@linux.dev> wrote:

> #regzbot introduced: f0ff84b7c3a

FWIW, that used to be "kasan: use stack_depot_put for Generic mode"

#regzbot resolve: fixed by "slub, kasan: improve interaction of KASAN
and slub_debug poisoning"
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
