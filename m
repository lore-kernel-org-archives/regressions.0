Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F332F24
	for <regressions@lists.linux.dev>; Wed,  2 Feb 2022 11:46:32 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nFE5k-0006et-9U; Wed, 02 Feb 2022 12:46:28 +0100
Message-ID: <12e09497-a848-b767-88f4-7dabd8360c5e@leemhuis.info>
Date: Wed, 2 Feb 2022 12:46:27 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-BS
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, workflows@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 regressions@lists.linux.dev, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <cover.1643110442.git.linux@leemhuis.info>
 <f97738d6250050bc982bf2947587f1c73f37446f.1643110442.git.linux@leemhuis.info>
 <CAMuHMdXRoVt_zRBNvugJjYhJnyYbABeCWv9fFRM0r_=s7FYvJQ@mail.gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v3 1/2] docs: add a document about regression handling
In-Reply-To: <CAMuHMdXRoVt_zRBNvugJjYhJnyYbABeCWv9fFRM0r_=s7FYvJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1643802392;3259a138;
X-HE-SMSGID: 1nFE5k-0006et-9U

Hi! I noticed I forgot to reply here:

On 26.01.22 15:28, Geert Uytterhoeven wrote:
> On Tue, Jan 25, 2022 at 5:45 PM Thorsten Leemhuis <linux@leemhuis.info> wrote:
>> +How to create a configuration similar to the one of an older kernel?
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Start a known-good kernel and configure the newer Linux version with ``make
>> +olddefconfig``. This makes the kernel's build scripts pick up the configuration
>> +file (the `.config` file) from the running kernel as base for the new one you
>> +are about to compile; afterwards they set all new configuration options to their
>> +default value, which should disable new features that might cause regressions.
> 
> Doing so may actually cause mutations to appear in your .config
> when going back and forth (i.e. when bisecting), interfering with
> the bisection process.

Good point, I knew about this, but hadn't thought of this when writing
the text.

> To avoid that, I usually start bisecting with
> "cp .config <src>/arch/<arch>/configs/bisect_defconfig", and use
> "make bisect_defconfig" in every bisection step. That way all steps
> are reproducible, and unaffected by config mutations.

That's a really cool trick, thx for mentioning it. But I think it's not
needed in the text about regressions and instead better be mentioned in
Documentation/admin-guide/bug-bisect.rst. I hope to sooner or later
improve (rewrite?) that document anyway and will make sure to keep it in
mind for that time.

I wonder if there is a way to make this work without messing in the
source tree? Took a quick look at the sources. It seems to me that it's
possible to "cp .config ~/working.config" and then using "make
KBUILD_DEFCONFIG=~/working.config defconfig" at every bisection step. It
seems to do the trick as well -- but I only tried briefly, so maybe I
might have missed something.

Ciao, Thorsten
