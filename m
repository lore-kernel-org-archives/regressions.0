Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A03FEA
	for <regressions@lists.linux.dev>; Mon,  4 Oct 2021 10:11:45 +0000 (UTC)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mXKwh-0000Xs-LM; Mon, 04 Oct 2021 12:11:43 +0200
Message-ID: <a5349810-aed0-3f35-654c-bfd89b2fc285@leemhuis.info>
Date: Mon, 4 Oct 2021 12:11:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-BS
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com>
 <438d711b-094b-fcfd-79e3-69f03a14df21@leemhuis.info>
 <637b0f3f-ac23-1e32-db7f-c696a04c1c73@leemhuis.info>
 <YVrI9rb4mnIs6RnF@kroah.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for
 use-after-free validation crashes apple T2 SSD
In-Reply-To: <YVrI9rb4mnIs6RnF@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1633342305;ae18c8d8;
X-HE-SMSGID: 1mXKwh-0000Xs-LM

On 04.10.21 11:27, Greg KH wrote:
> On Mon, Oct 04, 2021 at 11:17:21AM +0200, Thorsten Leemhuis wrote:
>> On 26.09.21 07:59, Thorsten Leemhuis wrote:
>>> On 25.09.21 15:10, Orlando Chamberlain wrote:
>>>> Commit e7006de6c238 causes the SSD controller on Apple T2 computers to crash
>>>> and prevents linux from booting.
>>>>
>>>> This commit implemented a counter that is stored within the NVMe command_id,
>>>> however this counter makes the command_id higher than normal, causing a panic
>>>> on the T2 security chip that functions as the SSD controller, which then
>>>> causes the system to power off after a few seconds.
>>>>
>>>> This was reported on bugzilla here:
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=214509 but it was not originally
>>>> classified as NVMe (when the report was created it was unknown what was
>>>> causing it), so I don't know if it notified the NVMe mailing list when it
>>>> was later reclassified to NVMe. Sorry if you've already seen this issue.
> [...]
>>> Feel free to ignore this message. I write it to make regzbot track above
> [...]
>> FWIW, this is just for the record: the fix for this landed in mainline,
>> but didn't refer to this thread or the one montitored, hence I need to
>> write this mail to make regzbot mark this regression as resolved:
>>
>> #regzbot monitor
>> https://lore.kernel.org/all/20210927154306.387437-1-kbusch@kernel.org/
> 
> Thanks for tracking this, I'll go queue it up for 5.10.y and 5.14.y now.

Nice to hear that regzbot is helpful even while still in the early stage
of field testing. FWIW, this regression made me consider adding two things:

* guess it would be a good idea if regzbot would simply export a
parseable list with commit IDs of still unresolved mainline regressions,
as your backports script then could simply consult it and put such
commits on hold

* it afaics should even be possible to make regzbot detect "hey, this
commit was backported, but the fix was not yet, so lets add it to the
list of regressions in stable and longterm kernels and notify the stable
team about it.

But for now there are other, more important things I need to work on.
Will add this to the issue tracker for regzbot to work on this another time.

Ciao, Thorsten



