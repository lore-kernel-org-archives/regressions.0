Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB5B1C31
	for <regressions@lists.linux.dev>; Sat,  3 Sep 2022 14:17:45 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.23]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N6JtR-1pRf4u1D3J-016cz8; Sat, 03 Sep 2022 16:17:25 +0200
Message-ID: <76951173-ce4e-adda-e80e-7c313725e937@i2se.com>
Date: Sat, 3 Sep 2022 16:17:24 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [BUG] null pointer dereference when loading bpf_preload on
 Raspberry Pi
Content-Language: en-US
To: Thorsten Leemhuis <linux@leemhuis.info>, regressions@lists.linux.dev
Cc: bpf@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 jpalus@fastmail.com
References: <f038d6f9-b96b-0749-111c-33ac8939a1c0@i2se.com>
 <56ffb198-8c93-1ec2-0b5e-9441e96359de@leemhuis.info>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <56ffb198-8c93-1ec2-0b5e-9441e96359de@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ov0oaWb7C/+FjrQe/F1UII/dPXzCZED0QapxnzPS7fBXveavtWV
 C/Vr99OiP1eDSl7KIDgtQX0pH1ch1a7TS5269er37UdzI0JtRKg536V3F29x5/x9CQuJk8Y
 tBJL+8l4Sv5Xc8/mRt3aGdzjzeEIpsQkQ7ZjUxwSKSBSxHuqvbv4B/VI/1SPqyKa0WOd8Bp
 hzOKmVWOqV1VWXbTx7A2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FS1JTfEW2Qs=:sIhZZDFMHvjT6JCtGogNms
 HmDuFYFWUI0DwM5Pyu27DfkpPj9zhrPQwmcAncThsVzaA8hnBuIkDQ6bmbnIDltRP5BzgbQ61
 agkAfDxeYln+qCYKVFxnZNEqxvHMOnOXS8fjDG4yW7qvtF2Sv+uz9jXnJaAnIIKVS153ZSOxi
 INbXVkbDSZpXRQCulW26ZWWQy9grstJ28ID1qhKy/B5mlC8r9gU7NFtVz6uuPsKhX/LCjITvT
 MUC+TTsipEuDJuDIaPQ0V5BwkdZLBPVclSiLJeEvHWxk8c1b5ymq6Vhl1XhQKKnqOnVgZCwaC
 g+YEyGnpgKaMtN2pUp/fyy/aH/Z+ARV6trsO8Z9bqbeAYdS3fDF6AFE4nM4LZpNM/A59pKzwX
 0J01g3rGaPUp3cfEZ1FQa1r8wxfzN0tf91biVAlw1QY9sdW5XpWsGMI+F5YaxG/OObn87NRUm
 eRmMlxMC1d8ec6cVAGa90UQ7+lPs44r+iHYgyP1e7GvNjXw1zPXxGDyCIJwSMBgh0Xf1qtqfW
 A9PGO5GLB/pYTJUS9GfKWKfKf6ZV4bOdrIUAVCWkozTZC7iwwm5bKAC62xOGJao+kVIjEoxZX
 0i93oyJKGLABbTNmzJkKxiAjx4aaTW0FKy53AoouZqYNYRCtBlNvsHpjRymHUZ52PMOH2uvCF
 mNeaqplUw5PKkS/OKXAp/bU8A5R4dvWkyWSLYChfVH0EYVxBQAX4j7/LQv85J8g91PYi2jwq2
 nqFImP8T5c2+kJnwlHqzz70BnS/pun3czONfBNNFFKk8o9ga0yuhsJdm3DHpefurdnp2nmUUb
 5GAQmDE

Hi Thorsten,

Am 19.06.22 um 19:06 schrieb Thorsten Leemhuis:
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]

as reported by Jan on Bugzilla [1] the issue has been resolved by

e2dcac2f58f5 ("BPF: Fix potential bad pointer dereference in 
bpf_sys_bpf()")|
|

|I can confirm the fix.
|

|#regzbot fixed-by: |e2dcac2f58f5
||

||

