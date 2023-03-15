Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEBB2F25
	for <regressions@lists.linux.dev>; Wed, 15 Mar 2023 09:28:52 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pcNRA-0006fF-0x; Wed, 15 Mar 2023 10:28:48 +0100
Message-ID: <d233a796-1cb8-a9b3-5a50-043dd2f98b3e@leemhuis.info>
Date: Wed, 15 Mar 2023 10:28:47 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, de-DE
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <1a788a8e7ba8a2063df08668f565efa832016032.1678021408.git.linux@leemhuis.info>
 <87a60frxk0.fsf@meer.lwn.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v3] docs: describe how to quickly build a trimmed kernel
In-Reply-To: <87a60frxk0.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1678872533;a7ad3816;
X-HE-SMSGID: 1pcNRA-0006fF-0x

On 14.03.23 19:35, Jonathan Corbet wrote:
> Thorsten Leemhuis <linux@leemhuis.info> writes:
> 
>> Add a text explaining how to quickly build a kernel, as that's something
>> users will often have to do when they want to report an issue or test
>> proposed fixes.
> 
> So I think the time has come to apply this.

Sounds good.

>  I did have one final
> thought, though...  In the v2 discussion, you said:
> 
>> Be warned, if it works I might do the same for "reporting issues". ;)
>> But let's first see how this goes (and if we get any feedback to be able
>> to tell if this experiment worked).
> 
> This caused me to wonder if we shouldn't create a new book called
> "tutorials" for this kind of stuff, with an explicit proviso that a more
> web-oriented approach is OK in that section?  Tutorial documentation
> *is* quite different from reference material, but we've really made no
> effort to treat the two differently so far.
> 
> Thoughts?

Hmmm. Thinking about this makes sense, as yes, reference material and
tutorials are different kind of texts.

I'm not against separating, but it currently kinda feels wrong.

Documentation/doc-guide/contributing.rst says that "books" are meant to
"group documentation for specific readers"; creating a new book for
tutorials would work against that, as readers (users and administrators
in this case) then would have to consult two books.

And isn't for example Documentation/process/submitting-patches.rst also
more of a tutorial than reference material (which we also have in the
form of Documentation/process/development-process.rst)? Does that mean
it should be moved? Into the same book or a separate book, as it has a
different target audience? I fear that might quickly get confusing for
readers without any real benefits

Or did I understand the idea of a new book wrong and you meant something
else? Like creating Documentation/admin-guide/tutorials/ and putting the
text there? That might work and would help future authors to get the
right mental model when writing new texts. But I'm not sure that's worth it.

Ciao, Thorsten
