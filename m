Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF68635
	for <regressions@lists.linux.dev>; Thu, 15 Jun 2023 07:24:13 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q9hKw-0007ow-FO; Thu, 15 Jun 2023 09:24:06 +0200
Message-ID: <53903462-2552-b707-3831-cad3ef873b0d@leemhuis.info>
Date: Thu, 15 Jun 2023 09:24:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] HID: logitech-hidpp: Handle timeout differently from busy
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Jiri Kosina <jikos@kernel.org>, Bastien Nocera <hadess@hadess.net>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
 =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
 Nestor Lopez Casado <nlopezcasad@logitech.com>, Mark Lord <mlord@pobox.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230531082428.21763-1-hadess@hadess.net>
 <nycvar.YFH.7.76.2305311606160.29760@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2306031440380.29760@cbobk.fhfr.pm>
 <15bb2507-a145-7f1b-8e84-58aeb02484b9@leemhuis.info>
 <nycvar.YFH.7.76.2306061527080.29760@cbobk.fhfr.pm>
 <42b6e582-f642-7521-135a-449140984211@leemhuis.info>
In-Reply-To: <42b6e582-f642-7521-135a-449140984211@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686813854;c246798b;
X-HE-SMSGID: 1q9hKw-0007ow-FO

On 06.06.23 20:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 06.06.23 15:27, Jiri Kosina wrote:
>> On Mon, 5 Jun 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>>> If an attempt at contacting a receiver or a device fails because the
>>>>>> receiver or device never responds, don't restart the communication, only
>>>>>> restart it if the receiver or device answers that it's busy, as originally
>>>>>> intended.
>>>>>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> [...]  
>>>> Unfortunately it doesn't seem to cure the reported issue (while reverting 
>>>> 586e8fede79 does):
> [...]
>> This should now all be fixed by
>>
>>     https://git.kernel.org/linus/7c28afd5512e371773dbb2bf95a31ed5625651d9
> 
> Jiri, Benjamin, many many thx for working on this.

FWIW, it seems things work for many people, but something still is not
completely right:

```
https://bugzilla.kernel.org/show_bug.cgi?id=217412

--- Comment #47 from Mark Blakeney ---
@Juha, kernel 6.3.7 adds the 2 patches intended to fix this bug and the
startup delay is now gone. However, I have had 2 cases over the last 5
days in which I have been running 6.3.7 where my mouse fails to be
detected at all after startup. I have to pull the Logitech receiver
out/in to get the mouse working. Never seen this issue before so I
suspect the patches are not right.
```

Ciao, Thorsten
