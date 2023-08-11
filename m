Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CCE1869
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 08:47:55 +0000 (UTC)
Received: from 46.183.103.8.relaix.net ([46.183.103.8] helo=[172.18.99.178]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qUNoD-0000Xs-E4; Fri, 11 Aug 2023 10:47:49 +0200
Message-ID: <f9e34f8a-5a7b-8223-c672-4fcb2bb23c0a@leemhuis.info>
Date: Fri, 11 Aug 2023 10:47:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: RE: [EXT] Re: [PATCH] crypto: caam - adjust RNG timing to support
 more devices
Content-Language: en-US, de-DE
To: Gaurav Jain <gaurav.jain@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
Cc: Bastian Krause <bst@pengutronix.de>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dan Douglass <dan.douglass@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Horia Geanta <horia.geanta@nxp.com>, Varun Sethi <V.Sethi@nxp.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230612082615.1255357-1-meenakshi.aggarwal@nxp.com>
 <e1f3f073-9d5e-1bae-f4f8-08dc48adad62@pengutronix.de>
 <f673a09e-e212-ee7b-15c3-78afe8c70916@pengutronix.de>
 <DU0PR04MB9563E31E69F93B63EE83DD378E39A@DU0PR04MB9563.eurprd04.prod.outlook.com>
 <DU0PR04MB95637D86F0134DC26EF955DB8E02A@DU0PR04MB9563.eurprd04.prod.outlook.com>
 <ZMzBWXpvdW5YB8bt@gondor.apana.org.au>
 <AM0PR04MB60046B045B5965A61BA1CA91E709A@AM0PR04MB6004.eurprd04.prod.outlook.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <AM0PR04MB60046B045B5965A61BA1CA91E709A@AM0PR04MB6004.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691743675;3d6e857f;
X-HE-SMSGID: 1qUNoD-0000Xs-E4

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 04.08.23 14:02, Gaurav Jain wrote:
> From: Herbert Xu <herbert@gondor.apana.org.au>
>> On Mon, Jul 24, 2023 at 05:13:23AM +0000, Meenakshi Aggarwal wrote:
>>> Please share the required information.
>> Any progress on this?
>>
>> Should we revert the offending patch?
> 
> Debugging is in progress. There should be some mismatch in TRNG configuration in customer board.
> Will be sharing a patch to dump the same.

Any progress on this? Afaics would be good to have either the fix or the
revert in by -rc7 to ensure things get at least one week of proper
testing before the final release.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
