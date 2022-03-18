Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A334C7E
	for <regressions@lists.linux.dev>; Fri, 18 Mar 2022 14:41:47 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nVDnV-0001ZP-Uq; Fri, 18 Mar 2022 15:41:46 +0100
Message-ID: <045ed627-e054-a42d-c3ec-e4e44bd1cf81@leemhuis.info>
Date: Fri, 18 Mar 2022 15:41:45 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH][SMB3] fix multiuser mount regression #forregzbot
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAH2r5mth2fYLzU5+oN09ipT7peRdyAiPCF-7_fLPsTpA-fKKLA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAH2r5mth2fYLzU5+oN09ipT7peRdyAiPCF-7_fLPsTpA-fKKLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1647614508;3203970e;
X-HE-SMSGID: 1nVDnV-0001ZP-Uq

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Seems below regression soon will be getting fixed, but with the nearing
final I want to have this in the tracking to make sure everyone is aware
of it:

#regzbot ^introduced 73f9bfbe3d81
#regzbot title cifs: smb3: incorrect session setup check for multiuser
mounts
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.



On 17.03.22 04:20, Steve French wrote:
> cifssmb3: fix incorrect session setup check for multiuser mounts
> 
> A recent change to how the SMB3 server (socket) and session status
> is managed regressed multiuser mounts by changing the check
> for whether session setup is needed to the socket (TCP_Server_info)
> structure instead of the session struct (cifs_ses). Add additional
> check in cifs_setup_sesion to fix this.
> 
> Fixes: 73f9bfbe3d81 ("cifs: maintain a state machine for tcp/smb/tcon sessions")
> Reported-by: Ronnie Sahlberg <lsahlber@redhat.com>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> ---
>  fs/cifs/connect.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 053cb449eb16..d3020abfe404 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3924,7 +3924,8 @@ cifs_setup_session(const unsigned int xid,
> struct cifs_ses *ses,
> 
>   /* only send once per connect */
>   spin_lock(&cifs_tcp_ses_lock);
> - if (server->tcpStatus != CifsNeedSessSetup) {
> + if ((server->tcpStatus != CifsNeedSessSetup) &&
> +     (ses->status == CifsGood)) {
>   spin_unlock(&cifs_tcp_ses_lock);
>   return 0;
>   }
> 
