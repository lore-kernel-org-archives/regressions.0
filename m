Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5428EB
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 09:29:17 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSx3H-00073H-Ii; Fri, 17 Feb 2023 10:29:11 +0100
Message-ID: <0c76e67d-5fc5-bfdc-9960-3ef308c23794@leemhuis.info>
Date: Fri, 17 Feb 2023 10:29:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US, de-DE
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 Greg KH <gregkh@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <8cfcf069d48c1b8d7b83aafe0132f8dad0f1d0ea.1676400947.git.linux@leemhuis.info>
 <873575gmlb.fsf@meer.lwn.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2] docs: describe how to quickly build a trimmed kernel
In-Reply-To: <873575gmlb.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1676626157;8ec6b675;
X-HE-SMSGID: 1pSx3H-00073H-Ii

On 17.02.23 01:30, Jonathan Corbet wrote:
> Thorsten Leemhuis <linux@leemhuis.info> writes:
> 
>> Add a text explaining how to quickly build a kernel, as that's something
>> users will often have to do when they want to report an issue or test
>> proposed fixes. This is a huge and frightening task for quite a few
>> users these days, as many rely on pre-compiled kernels and have never
>> built their own. They find help on quite a few websites explaining the
>> process in various ways, but those howtos often omit important details
>> or make things too hard for the 'quickly build just for testing' case
>> that 'localmodconfig' is really useful for. Hence give users something
>> at hand to guide them, as that makes it easier for them to help with
>> testing, debugging, and fixing the kernel.
>>
>> To keep the complexity at bay, the document explicitly focuses on how to
>> compile the kernel on commodity distributions running on commodity
>> hardware. People that deal with less common distributions or hardware
>> will often know their way around already anyway.
> 
> So this seems generally good though - as is my usual style - if it were
> mine I'd be trying to find a way to make it significantly shorter.

Yeah, I know, I tend to put a lot of details in the text, as I expect
some readers will need them (I guess I put the bar what I expect from
readers a lot lower than many others due to my time writing for a
mainstream computer magazine); but I hope the structure helps somewhat
to make it easy to read for people that don't need those details.

And I guess I sometimes use more words than needed. Happens in my first
language already, but I guess it's even worse when writing English. :-/

> I could certainly bikeshed a lot of things - I'm not convinced about the
> whole shallow-clone business, for example - but I'll try to restrain
> myself.

Regarding the "shallow-clone business": initially I really didn't want
to go down that route myself. But well, in my local testing I noticed
creating a full clone took longer than compiling the localmodconfig
kernel on my two year old laptop -- and that felt wrong given the
"quickly" in the headline. Disclaimer: I'm only connected to the net
through a 100 MBit line (there was never a need to upgrade); but I guess
100 MBit in some parts of the world where people might read this text is
still considered a lot.

>> The document heavily uses anchors and links to them, which makes things
>> slightly harder to read in the source form. But the intended target
>> audience is way more likely to read rendered versions of this text on
>> pages like docs.kernel.org anyway -- and there those anchors and links
>> allow easy jumps to the reference section and back, which makes the
>> document a lot easier to work with for the intended target audience.
> 
> I do wonder if all that back-and-forth actually makes things easier, and
> it definitely impedes use of the RST file.  I recognize that you're
> trying to do something a bit different here, though, and don't want to
> get in the way of the experiment.

Be warned, if it works I might do the same for "reporting issues". ;)
But let's first see how this goes (and if we get any feedback to be able
to tell if this experiment worked).

>  Given the purpose, though, I do have
> a couple of little thoughts:
> 
> - Somewhere at the top of the RST file should be a prominent link to the
>   rendered version, presumably on kernel.org.  It could perhaps be in an
>   RST comment that doesn't show up in the rendered version, saying
>   "perhaps you really want to read this ----> over there".

Good idea. I put this in my local draft:

```
..
    Note: if you see this note, you are reading the text's source file. You
    might want to switch to a rendered version, as it makes it a lot
easier to
    quickly look something up in the reference section and jump back to
where you
    left of afterwards. Find a the latest rendered version here:
    https://docs.kernel.org/admin-guide/quickly-build-trimmed-linux.html

```

That link obviously will be broken until the text reached mainline, but
I guess that can be ignored.

> - Eventually we should probably make the link to this document more
>   prominent on the front page - once we've figured out what we're doing
>   there :)

Will keep this in mind.

> Anyway, those quibbles aside, I think we should probably just apply this
> after the merge window.

Great. With a bit of luck some reviewers might find time to provide
feedback; maybe there are even a few "this can be written shorter" or
"do we really need this sentence" suggestions among it.

Ciao, Thorsten

P.S.: I know, it's late in the cycle, but if you want to do me a favor
it would be great if you might consider looking at or even merging the
"docs: recommend using Link: whenever using Reported-by:" change I
proposed, at it might make my regression tracking effort a tiny bit easier:
https://lore.kernel.org/linux-doc/9a07ec640d809723492f8ade4f54705914e80419.1676369564.git.linux@leemhuis.info/

