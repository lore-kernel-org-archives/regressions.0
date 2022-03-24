Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AB81FC0
	for <regressions@lists.linux.dev>; Thu, 24 Mar 2022 12:50:26 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nXMv2-0007At-5V; Thu, 24 Mar 2022 13:50:24 +0100
Message-ID: <973dfde3-8377-5ead-4022-c32a7ed9ffc6@leemhuis.info>
Date: Thu, 24 Mar 2022 13:50:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Bug 215687] New: chown behavior on XFS is changed
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 linux-xfs@vger.kernel.org, bugzilla-daemon@kernel.org
References: <bug-215687-201763@https.bugzilla.kernel.org/>
 <5d1a6abb-f2e7-55bb-a616-04890f3186f2@leemhuis.info>
In-Reply-To: <5d1a6abb-f2e7-55bb-a616-04890f3186f2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1648126226;9b8b0ca1;
X-HE-SMSGID: 1nXMv2-0007At-5V

On 24.03.22 11:22, Thorsten Leemhuis wrote:
> On 15.03.22 09:12, bugzilla-daemon@kernel.org wrote:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=215687
>>
>>            Summary: chown behavior on XFS is changed
> 
> Darrick, what's up with this bug reported more than ten days ago? 

Ahh, Zorro Lang replied in the ticket, seems things are okay now after
your discussed this on IRC, so let me remove this from the regression
tracking; if somebody really complains we ca start to track this again.

#regzbot invalid: seems reporter is okay with the changed behavior after
discussing this with the maintainer
https://bugzilla.kernel.org/show_bug.cgi?id=215687#c4

