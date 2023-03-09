Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD4463A7
	for <regressions@lists.linux.dev>; Thu,  9 Mar 2023 09:42:54 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id bw19so1187659wrb.13
        for <regressions@lists.linux.dev>; Thu, 09 Mar 2023 01:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678354972;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wuLPy2sMYtBfmQxncoZ40Eqi4zGrjoSAknQIMUnPxas=;
        b=QounHF5staDs4DOGbEwduUkHHWFMfw2zYOte27aPBDD7A7DW+z3+Aqq/X//xVDb0nL
         J7kWQD6+1zLIdlnX6Yt5qC8EHzosIgy4eYIKRekNsVfuUlFXakjN/GyTymRLs4JVS7J9
         sMMDCEs4HkUyZ7jEbiUxeoGnxOX8OmSwmauxbZd+lLI/rGVxZDpY/GpqwfxGEQ6PWUIo
         QGfMfrp+0/bH0HbK0tsB5KEcQ7s8D6ZUVgF9W6/hPkOEgqfSLKsBhxHYX3qLSi3rn01j
         R6mqc5d5YMpoLQvgXCCesyiKAVZ0ZF/SlTbwZ4LtzmKzBJ+v1ZlIr/cxJYKTWRgcWWzg
         MDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678354972;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuLPy2sMYtBfmQxncoZ40Eqi4zGrjoSAknQIMUnPxas=;
        b=VJt3J6Oj4bj9uv5YOyC53jfB4dWa9eC7zjmu61+A3SIBSSrVi+JUAa6cWgrZgHriuj
         JaMzcSsGjpfjyGmY6SkbuUfN2Sw249m8ShgcwJaxXgSodti2ZlT02l6Iv1ZovRS4i1gJ
         OohZwCbrr03azp0B2PVCqZR4GOABBWxUMTINEywLaoWWCGYuuCkBNVVzkn8aFLO1fp95
         9IN066fCAbFeTyhwY+TwIUxxSLAmEJdv4no2rwLG0CCRd1FKPpp0Y1F9p7bg4q6T28g2
         f3mFR2XBLhAbrto+KKMnwmZdKlB1dqd/jJ0lQ0gwfucMAYP00mU/z58/u6fi44kP2j39
         EPKw==
X-Gm-Message-State: AO0yUKXWfB7qlh5o6yYIos3B6HOqKw9+po5owTIfs2iQQr+qJz64ecgI
	/4lFTUdo6lrv8HVTTApfw91P8rcSobNenf8wdrk=
X-Google-Smtp-Source: AK7set+oTy1pFQhd93mb0R6GUkxa6hLKJ8n2ZIs8qWW/GxRdlg5mKauE8TCfF5QOc7UQWDUmaf28ru42xMHqLpoK8DE=
X-Received: by 2002:a5d:6787:0:b0:2cb:c474:75aa with SMTP id
 v7-20020a5d6787000000b002cbc47475aamr4617734wru.10.1678354972559; Thu, 09 Mar
 2023 01:42:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sylvain Menu <sylvain.menu@gmail.com>
Date: Thu, 9 Mar 2023 10:42:41 +0100
Message-ID: <CACH9xG8-tEtWstUVmD9eZFEEAqx-E8Gs14wDL+=uNtBK=-KJvQ@mail.gmail.com>
Subject: nfs mount disappears due to inode revalidate failure
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, chuck.lever@oracle.com, jlayton@kernel.org, 
	linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am writing to report an issue on a nfs mount that disappears due to
an inode revalide failure (already sent in January but probably banned
with html format...).
This very old commit
(https://github.com/torvalds/linux/commit/cc89684c9a265828ce061037f1f79f4a68ccd3f7)
exactly show the problem I have and this old resolved issue
(https://bugzilla.kernel.org/show_bug.cgi?id=117651) is probably
failing again today

To sum up, I have a NFS mount inside another NFS mount (for example:
/opt/nfs/mount1 & /opt/nfs/mount1/mount2).
If I kill a task trying to get a file descriptor on
/opt/nfs/mount1/mount2 then it will be unmounted. My simple test code
to reproduce very easily:

int main(int argc, char *argv[]) {
    while (1) {
        close(open(argv[1], O_RDONLY));
    }
}

In logs, I have: "nfs_revalidate_inode: (0:62/845965) getattr failed,
error=-512"

Tested on 5.19 and 6.1 kernel

Best regards,
Sylvain Menu
