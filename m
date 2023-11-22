Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA14CDEA
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r5pEq-00068f-Ii; Wed, 22 Nov 2023 16:34:04 +0100
Message-ID: <e1ca042c-de1d-4fe3-ad69-51d147b1fe0b@leemhuis.info>
Date: Wed, 22 Nov 2023 16:34:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to
 CONFIG_MICROCODE_AMD)
Content-Language: en-US, de-DE
To: Borislav Petkov <bp@alien8.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: lukas.bulwahn@gmail.com, dave.hansen@linux.intel.com, hpa@zytor.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 mingo@redhat.com, tglx@linutronix.de, x86@kernel.org
References: <20230825141226.13566-1-lukas.bulwahn@gmail.com>
 <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info>
 <20231112181036.GBZVEVHIIj/Oos1cx4@fat_crate.local>
 <0e9cbe6f-ac6c-47f2-b663-a22568799eca@leemhuis.info>
 <20231122115826.GAZV3s4krKXI002KQ0@fat_crate.local>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20231122115826.GAZV3s4krKXI002KQ0@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700667250;5cc0432b;
X-HE-SMSGID: 1r5pEq-00068f-Ii

Preface: considered CCing Linus here, as it's quite possible that I'm
wrong, as every situation is somewhat different. If anybody disagrees
with what I bring up below to hopefully clarify things thus please do me
a favor an CC Linus so he can clarify things.

Ohh, and sorry for being a PITA. I hate that, but when it comes to
regressions disagreements often happen, as all those discussions linked
at the end of https://docs.kernel.org/process/handling-regressions.html
illustrate.

On 22.11.23 12:58, Borislav Petkov wrote:
> On Wed, Nov 22, 2023 at 10:15:42AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
>> [1] unless you fiddle with things obviously internal; not sure if this
>> case would qualify for him, but somehow I doubt it -- but I might be
>> wrong there.
> 
> Well, think about it - by that logic, if CONFIG_* items are an ABI, we
> will never ever be able to change any of them. [...]

Can't follow your logic (or the one from Lukas in the other reply), as
what's an ABI (or an API) is afaik not the important factor when it
comes to the "no regressions" rule: you can change things (including
ABIs or APIs) all you want, as long as nothing breaks. To quote Linus from
https://lore.kernel.org/all/CAHk-=wiVi7mSrsMP=fLXQrXK_UimybW=ziLOwSzFTtoXUacWVQ@mail.gmail.com/

```
The rules about regressions have never been about any kind of
documented behavior, or where the code lives.

The rules about regressions are always about "breaks user workflow".

The other side of the coin is that people who talk about "API
stability" are entirely wrong. API's don't matter either. You can make
any changes to an API you like - as long as nobody notices.

Again, the regression rule is not about documentation, not about
API's, and not about the phase of the moon.

It's entirely about "we caused problems for user space that used to work".
```

>> BTW: I see that this could help preventing problems like the current one
>> to happen in the far future. But how would that help the current
>> situation (e.g. users that have an old dracut and updated the kernel
>> without updating dracut)?
> Update dracut too?

To quote Linus again, this time from
https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/

```
People should basically always feel like they can update their kernel
and simply not have to worry about it.

I refuse to introduce "you can only update the kernel if you also
update that other program" kind of limitations. If the kernel used to
work for you, the rule is that it continues to work for you.

There have been exceptions, but they are few and far between,
[...]
But if something actually breaks, then the change must get fixed or
reverted. And it gets fixed in the *kernel*. Not by saying "well, fix
your user space then".
```

Are those quotes fitting to the situation at hand? Not totally sure.
Initramfs generators might be special and we have done exceptions for
them in the past if no other solution could be found to prevent a
regression[1]. We'd need Linus to clarify.

Ciao, Thorsten

[1] maybe it's a naive idea, but can't we just avoid the problem at hand
by adding CONFIG_MICROCODE_AMD and CONFIG_MICROCODE_INTEL back as a
hidden config stub and remove those in ~3 years? Yeah, ugly, but we have
done things way more ugly than that to prevent regressions.
