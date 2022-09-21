Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F150E7C
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 09:55:08 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oawRe-0004yz-68; Wed, 21 Sep 2022 11:55:06 +0200
Message-ID: <e3353084-264c-859a-3b42-a98e29f039cf@leemhuis.info>
Date: Wed, 21 Sep 2022 11:55:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Ext4: Buffered random writes performance regression with
 dioread_nolock enabled
Content-Language: en-US, de-DE
To: Theodore Ts'o <tytso@mit.edu>
Cc: hazem ahmed mohamed <hazem.ahmed.abuelfotoh@gmail.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>
References: <CACX6voDfcTQzQJj=5Q-SLi0in1hXpo=Ri28rX73Og3GTObPBWA@mail.gmail.com>
 <48bb6266-2d5c-ffcd-6982-4fd02bfdcfc3@leemhuis.info>
 <Yyp59DELlYXpoCBC@mit.edu>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <Yyp59DELlYXpoCBC@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1663754109;89b6022b;
X-HE-SMSGID: 1oawRe-0004yz-68

On 21.09.22 04:41, Theodore Ts'o wrote:
> Hazem started separate e-mail threads on this issue (separated by
> about an hour), and I replied to the earlier one here:
> 
>     https://lore.kernel.org/all/Yypx6VQRbl3bFP2v@mit.edu/

#regbot monitor: https://lore.kernel.org/all/Yypx6VQRbl3bFP2v@mit.edu/

> TL;DR:
> 
> 1)  The patch landed in 5.6, and improved performance for some
> workloads, and also fixed a potential security problem (exposure of
> stale data caused by a race).
> 
> 2)  If you are using a storage device >= 128GB, and a version of
> e2fsprogs v1.43.2 (released six years ago), the journal size will be
> 1GB, which Hazem reported resolved the problem.
> 
> 3) I disagree that we should revert this commit, as it only changes a
> default.  If you prefer the older behavior, you can change it with a
> mount option.

Great, thx for clarifying, in that case let me remove this from the
tracking:

#regzbot invalid: caused by a change of defaults that (among others) was
done for security reasons, see Ted's answer in
https://lore.kernel.org/all/Yypx6VQRbl3bFP2v@mit.edu/ for details

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
