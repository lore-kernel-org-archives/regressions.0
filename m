Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74572F37
	for <regressions@lists.linux.dev>; Fri, 31 Mar 2023 13:38:18 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1piExE-0000vt-HN; Fri, 31 Mar 2023 15:38:08 +0200
Message-ID: <fc75aceb-1973-b29f-f026-de9345afcad1@leemhuis.info>
Date: Fri, 31 Mar 2023 15:38:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [REGRESSION] wrong coord from Thinkpad TrackPoint since 6.2
 kernel
Content-Language: en-US, de-DE
To: Hans de Goede <hdegoede@redhat.com>, Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: regressions@lists.linux.dev, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <87h6u4otuc.wl-tiwai@suse.de>
 <3dec29bf-b772-d82d-fff9-6c8bcca5f464@redhat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <3dec29bf-b772-d82d-fff9-6c8bcca5f464@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680269899;dec27279;
X-HE-SMSGID: 1piExE-0000vt-HN

On 29.03.23 11:22, Hans de Goede wrote:
> On 3/29/23 10:16, Takashi Iwai wrote:
>> we've received a bug report about Thinkpad TrackPoint (ALPS DualPoint
>> Stick) on 6.2 kernel:
>>   https://bugzilla.opensuse.org/show_bug.cgi?id=1209805
>
> [...]
> 
> I believe this is caused by the kernel now using -funsigned-char
> everywhere and this should be fixed by this commit:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=754ff5060daf5a1cf4474eff9b4edeb6c17ef7ab
> 
> And there is a similar issue in the focaltech touchpad driver:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=8980f190947ba29f23110408e712444884b74251
> 
> Dmitry, since this is hitting 6.2 users, perhaps you can send
> a pull-req for your current for-linus branch to get the fix
> on its way to stable ?

Hmm, no reply from Dmitry here or any other mail from him on lore since
a week. No big deal, but nevertheless a bit unfortunate, as I totally
agree: it would be really good to get this regressions fixed rather
sooner than later.

Is there any in-official de-facto co-maintainer for input that could
help out? CCing Jonathan, who according to get_maintainer.pl regularly
contributes to the input subsystem.

Guess if nothing happens soon I'll ask Linus to merge those two changes
directly, maybe he'll take them.

Ciao, Thorsten
