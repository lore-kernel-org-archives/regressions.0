Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AC7E6
	for <regressions@lists.linux.dev>; Mon, 20 Jun 2022 07:26:20 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o3Bnf-0002rB-7I; Mon, 20 Jun 2022 09:26:19 +0200
Message-ID: <b758d44d-0ce9-8014-3d73-3118792fd1e8@leemhuis.info>
Date: Mon, 20 Jun 2022 09:26:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Bug 215975 - NFSD stops serving clients #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <156f1150-e0d6-0ead-bdbf-58eb0049db26@leemhuis.info>
In-Reply-To: <156f1150-e0d6-0ead-bdbf-58eb0049db26@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1655709981;13f8c97e;
X-HE-SMSGID: 1o3Bnf-0002rB-7I

On 21.05.22 12:27, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> About a week ago a regression was reported to bugzilla.kernel.org that
> seems to be handled there already. Nevertheless, I'd like to add to the
> tracking to ensure it's not forgotten.
> 
> #regzbot introduced: v5.12..v5.13
> #regzbot from: Ho Ming Shun <cyph1984@gmail.com>
> #regzbot title: NFSD stops serving clients
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215975

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot invalid: different issue (NFS client has actually gone away),
see https://bugzilla.kernel.org/show_bug.cgi?id=215975#c47
