Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF417CD
	for <regressions@lists.linux.dev>; Fri, 23 Dec 2022 12:20:01 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p8h1r-0004Kz-Do; Fri, 23 Dec 2022 13:19:59 +0100
Message-ID: <e46e349f-1eb8-7cc8-f369-8616e6467950@leemhuis.info>
Date: Fri, 23 Dec 2022 13:19:59 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Repression on lseek (holes) on 1-byte files since Linux 6.1-rc1
 #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-btrfs@vger.kernel.org
References: <20221223020509.457113-1-joanbrugueram@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20221223020509.457113-1-joanbrugueram@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671798001;3f425b70;
X-HE-SMSGID: 1p8h1r-0004Kz-Do

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 23.12.22 03:05, Joan Bruguera wrote:
> From: Joan Bruguera Micó <joanbrugueram@gmail.com>
> 
> Hello,
> 
> I believe I have found a regression related to seeking file data and holes on
> 1-byte files since Linux 6.1-rc1:
> 
> Since Linux 6.1-rc1 I observe that, if I create a (non-sparse) 1-byte file and
> immediately run `lseek(SEEK_DATA, 0)` or `lseek(SEEK_HOLE, 0)` on it, it will
> act as if it was a sparse file, i.e. as if it had a hole from offset 0 to 1.
> [...]
> I've bisected the change in behaviour to commit
> b6e833567ea12bc47d91e4b6497d49ba60d4f95f
> "btrfs: make hole and data seeking a lot more efficient".

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced b6e833567ea12bc47d91e4b6497d49ba60d4f95f
#regzbot title btrfs: seeking file data and holes on 1-byte files since
Linux 6.1-rc1 acts differently
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
