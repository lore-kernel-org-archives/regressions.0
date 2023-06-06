Received: from mail.spahan.ch (homer.spahan.ch [88.198.59.12])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E2619915
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 17:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.spahan.ch (Postfix) with ESMTP id 3F08C1C1BE7;
	Tue,  6 Jun 2023 19:49:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at spahan.ch
Received: from mail.spahan.ch ([127.0.0.1])
	by localhost (homer.spahan.ch [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1wnkWPBdAhr; Tue,  6 Jun 2023 19:49:42 +0200 (CEST)
Received: from [IPV6:2a02:168:541e:57e1:b9ac:dc3e:41d5:c56c] (unknown [IPv6:2a02:168:541e:57e1:b9ac:dc3e:41d5:c56c])
	by mail.spahan.ch (Postfix) with ESMTPSA id 4A7851C0506;
	Tue,  6 Jun 2023 19:49:42 +0200 (CEST)
Message-ID: <7d54dc04-6b0d-1dfd-333a-4d5497da6ce2@spahan.ch>
Date: Tue, 6 Jun 2023 19:49:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] media: uvcvideo: Fix menu count handling for userspace XU
 mappings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 regressions@lists.linux.dev
References: <20230606170919.GJ25679@pendragon.ideasonboard.com>
 <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, fr-FR, de-CH
From: Poncho <poncho@spahan.ch>
In-Reply-To: <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.23 19:11, Laurent Pinchart wrote:
> This is untested. Poncho, would you be able to test this patch to see if
> it fixes your issue ?

Yes, your patch on top of 6.3.6 does fix my issue.
