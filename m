Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555DF7B
	for <regressions@lists.linux.dev>; Sun, 19 Jun 2022 12:37:42 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o2uBQ-0005Md-E4; Sun, 19 Jun 2022 14:37:40 +0200
Message-ID: <2c6bd8f9-e466-50d0-0d24-0ec334db37cb@leemhuis.info>
Date: Sun, 19 Jun 2022 14:37:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [bugzilla-daemon@kernel.org: [Bug 216109] New: Steam Deck fails
 to boot when E820 entries clipped out of _CRS] #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220609224339.GA543225@bhelgaas>
 <d4ea2dd2-2e89-d3a2-ee5c-f64bb1b8f576@leemhuis.info>
In-Reply-To: <d4ea2dd2-2e89-d3a2-ee5c-f64bb1b8f576@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1655642262;2a3567af;
X-HE-SMSGID: 1o2uBQ-0005Md-E4

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 12.06.22 13:11, Thorsten Leemhuis wrote:

>> Subject: [Bug 216109] New: Steam Deck fails to boot when E820 entries clipped
>> 	out of _CRS
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=216109

#regzbot fixed-by: a2b36ffbf5b6

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.


