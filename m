Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6351E9EF
	for <regressions@lists.linux.dev>; Tue,  1 Nov 2022 17:53:48 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1opvSG-0002CB-Mc; Tue, 01 Nov 2022 18:53:40 +0100
Message-ID: <0fb9b48e-3bcc-5a5e-15fb-1d3e2752d80b@leemhuis.info>
Date: Tue, 1 Nov 2022 18:53:40 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] cifs: fix regression in very old smb1 mounts
To: Ronnie Sahlberg <lsahlber@redhat.com>,
 linux-cifs <linux-cifs@vger.kernel.org>
Cc: Steve French <smfrench@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20221011231207.1458541-1-lsahlber@redhat.com>
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20221011231207.1458541-1-lsahlber@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667325229;4501b87e;
X-HE-SMSGID: 1opvSG-0002CB-Mc

On 12.10.22 01:12, Ronnie Sahlberg wrote:
> BZ: 215375
> 
> Fixes: 76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c ("cifs: remove support for NTLM and weaker authentication algorithms")
> Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>

Ronnie, Steve, did this change create any trouble in 6.1 pre-releases so
far? If not: could you please consider submitting this change for
inclusion in 6.0 and 5.15, as this is a regression from the 5.15 days
that according to the bugzilla ticket seem to annoy some people a lot.

Ciao, Thorsten

> ---
>  fs/cifs/connect.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 93e59b3b36c7..c77232096c12 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3922,12 +3922,11 @@ CIFSTCon(const unsigned int xid, struct cifs_ses *ses,
>  	pSMB->AndXCommand = 0xFF;
>  	pSMB->Flags = cpu_to_le16(TCON_EXTENDED_SECINFO);
>  	bcc_ptr = &pSMB->Password[0];
> -	if (tcon->pipe || (ses->server->sec_mode & SECMODE_USER)) {
> -		pSMB->PasswordLength = cpu_to_le16(1);	/* minimum */
> -		*bcc_ptr = 0; /* password is null byte */
> -		bcc_ptr++;              /* skip password */
> -		/* already aligned so no need to do it below */
> -	}
> +
> +	pSMB->PasswordLength = cpu_to_le16(1);	/* minimum */
> +	*bcc_ptr = 0; /* password is null byte */
> +	bcc_ptr++;              /* skip password */
> +	/* already aligned so no need to do it below */
>  
>  	if (ses->server->sign)
>  		smb_buffer->Flags2 |= SMBFLG2_SECURITY_SIGNATURE;
