Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9753210
	for <regressions@lists.linux.dev>; Thu,  2 Feb 2023 14:57:26 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pNb1Y-0001eT-4i; Thu, 02 Feb 2023 15:57:16 +0100
Message-ID: <f26a2cbd-f690-cff4-3b0a-652f1b7704bd@leemhuis.info>
Date: Thu, 2 Feb 2023 15:57:15 +0100
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
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <fabdb45fa44db2531f0dbe5e88545c49dfb87040.1675252073.git.linux@leemhuis.info>
 <1f217c94-b90f-359a-2142-0d3ae5d84fc6@leemhuis.info>
 <Y9vIVtnyvJBMmahC@kroah.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v1] docs: describe how to quickly build Linux
In-Reply-To: <Y9vIVtnyvJBMmahC@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1675349846;f9e361a1;
X-HE-SMSGID: 1pNb1Y-0001eT-4i

On 02.02.23 15:27, Greg KH wrote:
> On Thu, Feb 02, 2023 at 12:15:36PM +0100, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
>> [adding Konstantin and Greg to the list of recipients]
>>
>> On 01.02.23 12:52, Thorsten Leemhuis wrote:
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
>> Side note: after feedback on social media I'll likely switch to a title
>> like "how to quickly configure & build a trimmed-down Linux kernel", as
>> some people from the current title assumed this would be about things
>> like ccache. I'll also likely will switch to using a localversion file
>> in the buildroot instead of modifying the EXTRAVERSION in the top-level
>> makefile (but I haven't actually tried it yet).
>>
>>> [...]
>>>
>>> The text currently describes two approaches to retrieve Linux' sources
>>> using git: the regular clone with linux-stable as a remote and a shallow
>>> clone with just one branch from linux-stable. The shallow clone approach
>>> is a little bit more tricky to describe and handle, but downloads way
>>> less data – and thus is a lot quicker, unless you have a really really
>>> quick link to the internet (which in some parts of the world is hard to
>>> come by). That's why I wonder if the text should switch to making the
>>> shallow clone with selected stable branches the default. What do you
>>> think, dear reader?
>>
>> So, I looked into what Greg suggested (e.g.
>> https://kernel.org/best-way-to-do-linux-clones-for-your-ci.html and
>> https://www.kernel.org/cloning-linux-from-a-bundle.html
>> ). Assuming users have a up2date git (afaics 2.38+) I could use commands
>> like this in my text:
>>
>> curl -L
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/clone.bundle
>> -o ~/linux/linux-stable.git.bundle
>> git clone --bundle-uri=linux-stable.git.bundle
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> ~/linux/sources
>> rm ~/linux/linix-stable.git.bundle
>>
>> This took roundabout 16 minutes with my 100 Mbit cable internet
>> connection (~9 min for the download, 7 for the clone [the machine used
>> is somewhat old]) and downloads & stores ~4,5 GByte data (without checkout).
>>
>> [side note: using
>> "--bundle-uri=https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/clone.bundle"
>> does not work (due to the redirect? whatever) -- but that might be
>> unwise anyway in case the download is interrupted]
>>
>>
>> Then I tried creating a shallow clone like this:
>>
>> git clone
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> --depth 1 -b v6.1
>> git remote set-branches --add origin master
>> git fetch --all --shallow-exclude=v6.1
>> git remote add -t linux-6.1.y linux-stable
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> git fetch --all --shallow-exclude=v6.1
>>
>> This took only roundabout 2 minutes and downloads & stores ~512 MByte
>> data (without checkout).
>>
>>
>> Not totally sure, but the shallow clone somehow feels more appropriate
>> for the use case (reminder, there is a "quickly" in the document title),
>> even if such a clone is less flexible (e.g. users have to manually add
>> stable branches they are interested it; and they need to be careful when
>> using git fetch).
>>
>> That's why I now strongly consider using the shallow clone method by
>> default in v2 of this text. Or does that also create a lot of load on
>> the servers? Or are there other strong reason why using a shallow clone
>> might be a bad idea for this use case?
> 
> I think Konstantin answered your question already on a social network
> based on the server load question.

Yup, he did. For the record, this is what he wrote:

```
it [a shallow clone] is pretty expensive on the server side, but it is
only really a problem when a bunch of shallow clones are performed at
once (e.g. when a CI farm does it across 50 nodes or something). When
that happens, it overwhelms the server.

If an actual human being does a single shallow clone it's not a big deal.
```

> For the "will this work for testing", sure, a shallow clone should work
> just fine, if no one has to use 'git bisect' to go back further than the
> version you originally clone.  Hopefully that's not a normal thing.

Yeah, that's something I have in mind already. But seems it's not much
of a problem, as one apparently can access older versions (including
tags) by deepening a shallow clone with a command like "git fetch origin
--shallow-exclude=v5.19" these days.

Ciao, Thorsten
