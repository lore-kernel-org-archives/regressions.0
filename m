Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A22F32
	for <regressions@lists.linux.dev>; Wed,  1 Feb 2023 13:22:13 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pND3w-0004yA-I2; Wed, 01 Feb 2023 14:22:08 +0100
Message-ID: <3d568611-8119-37c7-7d84-61cb97532446@leemhuis.info>
Date: Wed, 1 Feb 2023 14:22:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <fabdb45fa44db2531f0dbe5e88545c49dfb87040.1675252073.git.linux@leemhuis.info>
 <Y9peNbWUR9JmTJbo@kroah.com> <Y9pep+GBBaTiN/sN@kroah.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v1] docs: describe how to quickly build Linux
In-Reply-To: <Y9pep+GBBaTiN/sN@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1675257733;7b98290e;
X-HE-SMSGID: 1pND3w-0004yA-I2

On 01.02.23 13:44, Greg KH wrote:
> On Wed, Feb 01, 2023 at 01:42:29PM +0100, Greg KH wrote:
>> On Wed, Feb 01, 2023 at 12:52:30PM +0100, Thorsten Leemhuis wrote:
>>> Add a text explaining how to quickly build a kernel, as that's something
>>> users will often have to do when they want to report an issue or test
>>> proposed fixes. This is a huge and frightening task for quite a few
>>> users these days, as many rely on pre-compiled kernels and have never
>>> built their own. They find help on quite a few websites explaining the
>>> process in various ways, but those howtos often omit important details
>>> or make things too hard for the 'quickly build just for testing' case
>>> that 'localmodconfig' is really useful for. Hence give users something
>>> at hand to guide them, as that makes it easier for them to help with
>>> testing, debugging, and fixing the kernel.
>>
>> First off, this is great, thanks for doing this.

Thx, feels good to hear.

Bisection is next on my todo list once this matured...

>> One minor comment, to prevent people from "overloading" the
>> git.kernel.org systems:
>>
>>> +.. _sources_sbs:
>>> +
>>> + * Retrieve the sources of the Linux version you intend to build; then change
>>> +   into the directory holding them, as all further commands in this guide are
>>> +   meant to be executed from there.
>>> +
>>> +   If you plan to only build one particular kernel version, download its source
>>> +   archive from https://kernel.org; afterwards extract its content to '~/linux/'
>>> +   and change into the directory created during extraction.
>>> +
>>> +   In most other situations your best choice is to fetch the sources using git::
>>> +
>>> +          git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git \
>>> +            ~/linux/sources
>>> +          cd ~/linux/sources/
>>
>> Ideally you should never do a "full clone from scratch" like this, as it
>> takes up loads of server resources.  The "best" way to do this is to
>> download the kernel git bundle, and then pull and resolve the remaining
>> bits.  It's explained, with a script to do the work for you, here:
>>
>> 	https://kernel.org/best-way-to-do-linux-clones-for-your-ci.html
> 
> Oops, here's the full steps involved:
> 	https://www.kernel.org/cloning-linux-from-a-bundle.html
> the first link above has a script that does it all for you, but you
> probably just want to copy the steps at this last link instead.

Great idea, thx for bringing this up -- now that you mention it, I
remember those pages and the script again... :-/

Sadly my "after cloning Linus tree, add the stable tree as remote and
fetch everything" approach would will still create a lot of load. I
could use the script with the stable git repo, as that includes
mainline; but I noticed it sometimes is not fully up2date. At least I
once noticed it was quite a few hours (or maybe even a day?) behind. Is
that normal? I assume you should know.

Anyway: maybe "a little bit behind" isn't something that's much of a
problem for this document.

Ciao, Thorsten
