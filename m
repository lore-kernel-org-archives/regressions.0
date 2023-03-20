Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F81104
	for <regressions@lists.linux.dev>; Mon, 20 Mar 2023 06:45:06 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pe9GS-0007YZ-Gk; Mon, 20 Mar 2023 07:45:04 +0100
Message-ID: <e6314dd6-df75-fff8-1e3c-546b2b44be5b@leemhuis.info>
Date: Mon, 20 Mar 2023 07:45:04 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Consider picking up "scsi: core: Fix a procfs host directory
 removal regression" for stable
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>,
 scsi <linux-scsi@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <472c53aa-4803-cde9-8f80-cbd7d33dc9c5@leemhuis.info>
In-Reply-To: <472c53aa-4803-cde9-8f80-cbd7d33dc9c5@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679294707;1b280684;
X-HE-SMSGID: 1pe9GS-0007YZ-Gk

On 20.03.23 07:19, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi Greg. From https://bugzilla.kernel.org/show_bug.cgi?id=217215 it
> looks like you want to add be03df3d4bfe ("scsi: core: Fix a procfs host
> directory removal regression") to your stable queue. It lacks a stable
> tag, but fixes a bug in a commit that afaics was backported to all
> stable series last week.
> 
> Side note: would you scripts have noticed this automatically and added
> it to the queue today? (Just wondering if this mail actually makes any
> difference.)

Sorry, ignore that, I noticed that fix is already in your queue (I
looked at it before writing that mail, but it seems I somehow missed it
and only noticed now; sorry for the noise).

Ciao, Thorsten
